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
        throw UnsupportedError('DefaultFirebaseOptions are not supported for Fuchsia.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBw7l7JKNG2cR4EbVly0RXFVQAplR0VMmc',
    appId: '1:245372490842:android:0dece9b9be8e8096713463',
    messagingSenderId: '245372490842',
    projectId: 'fir-2d661',
    storageBucket: 'fir-2d661.firebasestorage.app',
  );

  static const FirebaseOptions ios = android;
  static const FirebaseOptions macos = android;
  static const FirebaseOptions windows = android;
  static const FirebaseOptions linux = android;
  static const FirebaseOptions web = android;
}
