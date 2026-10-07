// Generated-style Firebase configuration placeholder.
// Replace these values with your own Firebase project configuration for
// Firebase-backed features. No private keys are stored in this file.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for Fuchsia.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'replace-with-your-firebase-api-key',
    appId: '1:000000000000:android:replace-with-your-app-id',
    messagingSenderId: '000000000000',
    projectId: 'replace-with-your-firebase-project-id',
    storageBucket: 'replace-with-your-firebase-storage-bucket',
  );

  static const FirebaseOptions ios = android;
  static const FirebaseOptions macos = android;
  static const FirebaseOptions windows = android;
  static const FirebaseOptions linux = android;
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'replace-with-your-firebase-api-key',
    appId: '1:000000000000:web:replace-with-your-app-id',
    messagingSenderId: '000000000000',
    projectId: 'replace-with-your-firebase-project-id',
    authDomain: 'replace-with-your-firebase-project-id.firebaseapp.com',
    storageBucket: 'replace-with-your-firebase-storage-bucket',
  );
}
