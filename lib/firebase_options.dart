// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB-0lJGVUpeK0BlvArVSS1AqHmjwcE_CFM',
    appId: '1:25456329909:web:142d1982fedb31ed862afc',
    messagingSenderId: '25456329909',
    projectId: 'logintask-9b308',
    authDomain: 'logintask-9b308.firebaseapp.com',
    storageBucket: 'logintask-9b308.appspot.com',
    measurementId: 'G-PPEGF2RZYB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXbQHEOn7dMcNR3bqsO-AnDvHo2EZipnQ',
    appId: '1:25456329909:android:bd3c9422674fd267862afc',
    messagingSenderId: '25456329909',
    projectId: 'logintask-9b308',
    storageBucket: 'logintask-9b308.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALv8sknWNCSlGAEVHrsgHdtXwNwAWYbCQ',
    appId: '1:25456329909:ios:e1fce921126c4203862afc',
    messagingSenderId: '25456329909',
    projectId: 'logintask-9b308',
    storageBucket: 'logintask-9b308.appspot.com',
    iosBundleId: 'com.example.task1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALv8sknWNCSlGAEVHrsgHdtXwNwAWYbCQ',
    appId: '1:25456329909:ios:e1fce921126c4203862afc',
    messagingSenderId: '25456329909',
    projectId: 'logintask-9b308',
    storageBucket: 'logintask-9b308.appspot.com',
    iosBundleId: 'com.example.task1',
  );

}