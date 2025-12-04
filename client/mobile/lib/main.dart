import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sepurito/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
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