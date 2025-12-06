import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sepurito/pages/splash_screen.dart';
import 'package:sepurito/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
  );

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Sepurito());
}



class Sepurito extends StatelessWidget {
  const Sepurito({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sepurito",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}