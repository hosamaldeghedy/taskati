 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskaty_app/screens/auth_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    nextScreen();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body :
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/splash_icon.json'),
              Text('Taskati', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              ) ,
              SizedBox(height: 20,),
              Text('IT IS TIME TO ORGANIZE YOUR TASKS', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),)
            ],
          ),
        )
    );
  }

  void nextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(),
        ),
      );
    });
     

  }
}
