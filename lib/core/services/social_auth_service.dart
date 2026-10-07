import 'dart:io';

import 'package:evira_e_commerce/core/constants/redirects.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class SocialAuthService {
  bool isLoggedIn() => Supabase.instance.client.auth.currentSession != null;

  Future<void> signOut() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
    } catch (_) {}
    await Supabase.instance.client.auth.signOut();
  }

  /// Initiates Google Sign-In with native credential support and Supabase OAuth fallback.
  Future<void> signInWithGoogle() async {
    final webClientId = dotenv.env['WEB_CLIENT_ID'];
    final iosClientId = dotenv.env['IOS_CLIENT_ID'];

    // Try native Google Sign-In if client ID is configured
    if (webClientId != null &&
        webClientId.isNotEmpty &&
        !webClientId.contains('your-')) {
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn(
          serverClientId: webClientId,
          clientId: Platform.isIOS ? iosClientId : null,
        );
        final googleUser = await googleSignIn.signIn();
        if (googleUser == null) {
          throw const AuthException('Google sign-in was canceled.');
        }
        final googleAuth = await googleUser.authentication;
        final idToken = googleAuth.idToken;
        final accessToken = googleAuth.accessToken;
        if (idToken != null) {
          await Supabase.instance.client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken,
          );
          return;
        }
      } catch (e) {
        if (e is AuthException && e.message.contains('canceled')) {
          rethrow;
        }
        // Fall back to Supabase browser OAuth flow if native attempt fails
      }
    }

    // Supabase browser OAuth deep-link flow
    final started = await Supabase.instance.client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: Redirects.google,
      authScreenLaunchMode: LaunchMode.externalApplication,
    );
    if (!started) {
      throw const AuthException('Could not start Google sign-in.');
    }
  }
}
