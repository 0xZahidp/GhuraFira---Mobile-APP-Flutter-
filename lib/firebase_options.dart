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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBRQFGJCBHaBIiQ3KoCUPCGhjc6cZkZxCI',
    appId: '1:785976862792:web:b8d5223f75da64d3d3907d',
    messagingSenderId: '785976862792',
    projectId: 'ghura-fira-b7687',
    authDomain: 'ghura-fira-b7687.firebaseapp.com',
    storageBucket: 'ghura-fira-b7687.firebasestorage.app',
    measurementId: 'G-BZWDGLF06B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjWc8BuiKsckrNwT7_o-6NZibNojAECUY',
    appId: '1:785976862792:android:3f7ec35eb71fcbbdd3907d',
    messagingSenderId: '785976862792',
    projectId: 'ghura-fira-b7687',
    storageBucket: 'ghura-fira-b7687.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgoqsmCCe_p7ICJoX2tT-VG3VisqfjXUw',
    appId: '1:785976862792:ios:da585c77f444a389d3907d',
    messagingSenderId: '785976862792',
    projectId: 'ghura-fira-b7687',
    storageBucket: 'ghura-fira-b7687.firebasestorage.app',
    iosClientId: '785976862792-golvigf61o7ciigd536c5s1616l2gtjl.apps.googleusercontent.com',
    iosBundleId: 'com.ghurafira.app.ghurafira',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBRQFGJCBHaBIiQ3KoCUPCGhjc6cZkZxCI',
    appId: '1:785976862792:web:347611c80b3f7b54d3907d',
    messagingSenderId: '785976862792',
    projectId: 'ghura-fira-b7687',
    authDomain: 'ghura-fira-b7687.firebaseapp.com',
    storageBucket: 'ghura-fira-b7687.firebasestorage.app',
    measurementId: 'G-WGP88HRMMD',
  );

}