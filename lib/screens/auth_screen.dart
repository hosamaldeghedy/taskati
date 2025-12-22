import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty_app/screens/home_screen.dart';

import '../widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;

  void pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  void pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Visibility(
                   visible: photo==null,
                     replacement: CircleAvatar(radius: 100, backgroundColor: Colors.black
                         ,backgroundImage: Image.file(File(photo?.path??'')).image

                     ),
                     child: CircleAvatar(
                       radius: 100,
                       backgroundColor: Colors.black,
                       child: Icon(
                         Icons.person,
                         size: 100,
                         color: Colors.deepPurple,
                       ),
                     ) , ) ,
                 SizedBox(height: 20),
                AppButton(
                  title: 'Upload From Camera',
                  onPressed: pickImageFromCamera,
                ),
                const SizedBox(height: 20),
                AppButton(title: 'Upload From Gallery', onPressed: pickImageFromGallery ),
                SizedBox(height: 10),
                Divider(thickness: 2, color: Colors.black),
                SizedBox(height: 10,),

                TextFormField(onTapOutside: (value){
                  FocusScope.of(context).unfocus() ;  },
                decoration: InputDecoration(
                  label:Row( 
                    children: [
                      Icon(Icons.person,color: Colors.deepPurple,),
                      Text('Enter User Name'),
                    ]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12) ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple , width: 2)
                  ),
                ),

                ),
                SizedBox(height: 10,),

                TextFormField(onTapOutside: (value){
                FocusScope.of(context).unfocus() ;  },

                decoration: InputDecoration(

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  ),
                label: Row(
                  children: [
                  Icon(Icons.lock,color: Colors.deepPurple,),
                  Text('Enter User password'),
                ],),
                ),
                ),
                SizedBox(height: 10,),
                AppButton(title: 'register', onPressed: (){
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>HomeScreen()), (e)=>false);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
