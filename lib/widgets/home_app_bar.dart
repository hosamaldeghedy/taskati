import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskaty_app/models/user_model.dart';

import '../app_strings.dart';
import '../screens/auth_screen.dart';

class HomeAppBar extends StatelessWidget {
  final UserModel? user;
  const HomeAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ${user?.name ?? 'guest'}',
                style: const TextStyle(color: Colors.black, fontSize: 22),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text('Have a nice day', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),

        SizedBox(width: 10),

        CircleAvatar(
          radius: 50,
          backgroundImage: Image.file(File(user?.image ?? '')).image,
        ),
        IconButton(
          onPressed: () {
            Hive.box<UserModel>(AppStrings.userBox).clear();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
              (route) => false,
            );
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }
}
