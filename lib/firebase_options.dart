// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
//import 'package:solarflow_control/firebase_options.dart';
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
    apiKey: 'AIzaSyDKZedGT3WtGUy7iraqWNTLNY49vJFyUxU',
    appId: '1:250923345499:web:8b75d830b3a0895e6d817e',
    messagingSenderId: '250923345499',
    projectId: 'solarflow-77ab7',
    authDomain: 'solarflow-77ab7.firebaseapp.com',
    storageBucket: 'solarflow-77ab7.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOj09BunpJy-loukmXXOdvVG0ZmnkBotE',
    appId: '1:250923345499:android:e9a7eddddaf2e0c66d817e',
    messagingSenderId: '250923345499',
    projectId: 'solarflow-77ab7',
    storageBucket: 'solarflow-77ab7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCO9XiVfaZ116ufsgGs5AzMLuKfGcpBVb4',
    appId: '1:250923345499:ios:84258a956c6bfdf06d817e',
    messagingSenderId: '250923345499',
    projectId: 'solarflow-77ab7',
    storageBucket: 'solarflow-77ab7.firebasestorage.app',
    iosBundleId: 'com.example.solarflowControl',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCO9XiVfaZ116ufsgGs5AzMLuKfGcpBVb4',
    appId: '1:250923345499:ios:84258a956c6bfdf06d817e',
    messagingSenderId: '250923345499',
    projectId: 'solarflow-77ab7',
    storageBucket: 'solarflow-77ab7.firebasestorage.app',
    iosBundleId: 'com.example.solarflowControl',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKZedGT3WtGUy7iraqWNTLNY49vJFyUxU',
    appId: '1:250923345499:web:2d2660b8d19ee4226d817e',
    messagingSenderId: '250923345499',
    projectId: 'solarflow-77ab7',
    authDomain: 'solarflow-77ab7.firebaseapp.com',
    storageBucket: 'solarflow-77ab7.firebasestorage.app',
  );
  //await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
//);
}
