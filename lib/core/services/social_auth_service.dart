import 'package:evira_e_commerce/core/constants/redirects.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class SocialAuthService {
  Future<void> signInWithFacebook() async {
    await Supabase.instance.client.auth.signInWithOAuth(
      OAuthProvider.facebook,
      redirectTo: Redirects.facebook,
    );
  }

  bool isLoggedIn() => Supabase.instance.client.auth.currentSession != null;

  Future<void> signOut() => Supabase.instance.client.auth.signOut();

  /// Opens the native/browser Google OAuth flow and returns through the
  /// blackcode://auth-callback deep link. Google provider must be enabled in
  /// Supabase Auth > Providers and this callback must be allow-listed there.
  Future<void> signInWithGoogle() async {
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
