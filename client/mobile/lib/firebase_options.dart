import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBCpjMlFfMU8eIpZjvoyVKqfDq0D58DVLw',
    appId: '1:342610841938:web:f7feb605aae88e0d3d2a8b',
    messagingSenderId: '342610841938',
    projectId: 'sepurito',
    authDomain: 'sepurito.firebaseapp.com',
    storageBucket: 'sepurito.firebasestorage.app',
    measurementId: 'G-XH8HJK35PT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCnz8VB25E0xKCUfo5IEMt6kHCXfuINeI',
    appId: '1:342610841938:android:f515467f20daafbc3d2a8b',
    messagingSenderId: '342610841938',
    projectId: 'sepurito',
    storageBucket: 'sepurito.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2gdMAPkMTlUya11NOCrlTPUFc-cSZ_k0',
    appId: '1:342610841938:ios:52fec272141dd08a3d2a8b',
    messagingSenderId: '342610841938',
    projectId: 'sepurito',
    storageBucket: 'sepurito.firebasestorage.app',
    iosBundleId: 'com.example.sepurito',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2gdMAPkMTlUya11NOCrlTPUFc-cSZ_k0',
    appId: '1:342610841938:ios:52fec272141dd08a3d2a8b',
    messagingSenderId: '342610841938',
    projectId: 'sepurito',
    storageBucket: 'sepurito.firebasestorage.app',
    iosBundleId: 'com.example.sepurito',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCpjMlFfMU8eIpZjvoyVKqfDq0D58DVLw',
    appId: '1:342610841938:web:a3146a3c898f940d3d2a8b',
    messagingSenderId: '342610841938',
    projectId: 'sepurito',
    authDomain: 'sepurito.firebaseapp.com',
    storageBucket: 'sepurito.firebasestorage.app',
    measurementId: 'G-QPXRFNQJTM',
  );
}
