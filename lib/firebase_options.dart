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
        return windows;
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
    apiKey: 'AIzaSyBkmNjvth9ub0JOAkFk7WVqZOpGFHgkdEQ',
    appId: '1:521050521557:web:6bb6b628637eab3beb475c',
    messagingSenderId: '521050521557',
    projectId: 'musicapp-532ff',
    authDomain: 'musicapp-532ff.firebaseapp.com',
    storageBucket: 'musicapp-532ff.appspot.com',
    measurementId: 'G-1SKQVQ9KG0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCr_4sVxzlvM9UgSj32_GHyA34BBt_PDtU',
    appId: '1:521050521557:android:92bbb26751b82f86eb475c',
    messagingSenderId: '521050521557',
    projectId: 'musicapp-532ff',
    storageBucket: 'musicapp-532ff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlPmXN8lQ_i1gLocHnC-lig5TEJz46rCg',
    appId: '1:521050521557:ios:ea73252aa2ecc5e4eb475c',
    messagingSenderId: '521050521557',
    projectId: 'musicapp-532ff',
    storageBucket: 'musicapp-532ff.appspot.com',
    iosBundleId: 'com.example.musicapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlPmXN8lQ_i1gLocHnC-lig5TEJz46rCg',
    appId: '1:521050521557:ios:ea73252aa2ecc5e4eb475c',
    messagingSenderId: '521050521557',
    projectId: 'musicapp-532ff',
    storageBucket: 'musicapp-532ff.appspot.com',
    iosBundleId: 'com.example.musicapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkmNjvth9ub0JOAkFk7WVqZOpGFHgkdEQ',
    appId: '1:521050521557:web:3d541a5a4693923ceb475c',
    messagingSenderId: '521050521557',
    projectId: 'musicapp-532ff',
    authDomain: 'musicapp-532ff.firebaseapp.com',
    storageBucket: 'musicapp-532ff.appspot.com',
    measurementId: 'G-C52MR61D17',
  );
}
