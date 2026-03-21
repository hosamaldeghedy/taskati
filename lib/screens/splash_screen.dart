 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskaty_app/screens/auth_screen.dart';
import '../app_strings.dart';
import '../models/user_model.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

   @override
   void initState() {
     super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
       checkUser();
     });
   }

   void checkUser() {
     Future.delayed(Duration(seconds: 3), () {
       var box = Hive.box<UserModel>('user');

       if (box.isNotEmpty) {
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(
             builder: (_) => HomeScreen(),
           ),
         );
       } else {
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(
             builder: (_) => AuthScreen(),
           ),
         );
       }
     });
   }   @override
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
      if (Hive.box<UserModel>(AppStrings.userBox).isNotEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),

        );
      } else {
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthScreen(),),

        );
      }
    });


  }
}
