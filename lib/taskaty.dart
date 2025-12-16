import 'package:flutter/material.dart';
import 'package:taskaty_app/screens/splash_screen.dart';

class Taskaty extends StatelessWidget {

  const Taskaty ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
