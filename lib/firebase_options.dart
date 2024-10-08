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
    apiKey: 'AIzaSyDrPmY24zCTzbp0XNpvlceuxNPEismgKTU',
    appId: '1:343531657076:web:2bab555a65486222d97e21',
    messagingSenderId: '343531657076',
    projectId: 'movies-app-cbe3c',
    authDomain: 'movies-app-cbe3c.firebaseapp.com',
    storageBucket: 'movies-app-cbe3c.appspot.com',
    measurementId: 'G-PV8D98F9GG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWiy08YaryUkOJHgw6ya2qbyiEen-32bQ',
    appId: '1:343531657076:android:e3b06daf7b9898c3d97e21',
    messagingSenderId: '343531657076',
    projectId: 'movies-app-cbe3c',
    storageBucket: 'movies-app-cbe3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWKklDjSZ4RkzzJvlEzveub97E5jKy7l8',
    appId: '1:343531657076:ios:e714a30b37daadefd97e21',
    messagingSenderId: '343531657076',
    projectId: 'movies-app-cbe3c',
    storageBucket: 'movies-app-cbe3c.appspot.com',
    iosBundleId: 'com.example.moviesWebsiteApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWKklDjSZ4RkzzJvlEzveub97E5jKy7l8',
    appId: '1:343531657076:ios:e714a30b37daadefd97e21',
    messagingSenderId: '343531657076',
    projectId: 'movies-app-cbe3c',
    storageBucket: 'movies-app-cbe3c.appspot.com',
    iosBundleId: 'com.example.moviesWebsiteApps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDrPmY24zCTzbp0XNpvlceuxNPEismgKTU',
    appId: '1:343531657076:web:d774f627e2433a16d97e21',
    messagingSenderId: '343531657076',
    projectId: 'movies-app-cbe3c',
    authDomain: 'movies-app-cbe3c.firebaseapp.com',
    storageBucket: 'movies-app-cbe3c.appspot.com',
    measurementId: 'G-KXG66EWVWT',
  );
}
