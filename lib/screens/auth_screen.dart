import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty_app/models/user_model.dart';
import 'package:taskaty_app/screens/home_screen.dart';

import '../app_strings.dart';
import '../widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  final UserModel? user;

  const AuthScreen({super.key, this.user});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

bool isPasswordHidden = true;

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;

  final TextEditingController nameController = TextEditingController();

  late Box<UserModel> box;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    box = Hive.box<UserModel>('user');
    user = box.isNotEmpty ? box.getAt(0) : null;
  }

  void pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  addUserData() async {
    var myBox = Hive.box<UserModel>(AppStrings.userBox);
    await myBox.clear();
    myBox
        .add(UserModel(image: photo?.path ?? '', name: nameController.text))
        .then((v) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (c) => HomeScreen()),
            (e) => false,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: photo == null,
                  replacement: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.black,
                    backgroundImage: photo != null
                        ? FileImage(File(photo!.path))
                        : null,
                  ),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                AppButton(
                  title: 'Upload From Camera',
                  onPressed: pickImageFromCamera,
                ),

                const SizedBox(height: 20),

                AppButton(
                  title: 'Upload From Gallery',
                  onPressed: pickImageFromGallery,
                ),

                const SizedBox(height: 10),
                const Divider(thickness: 2, color: Colors.black),
                const SizedBox(height: 10),

                TextFormField(
                  controller: nameController,
                  onTapOutside: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    label: const Row(
                      children: [
                        Icon(Icons.person, color: Colors.deepPurple),
                        SizedBox(width: 5),
                        Text('Enter User Name'),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Colors.grey),
                const SizedBox(height: 10),

                TextFormField(
                  obscureText: isPasswordHidden,
                  onTapOutside: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    label: const Row(
                      children: [
                        Icon(Icons.lock, color: Colors.deepPurple),
                        SizedBox(width: 5),
                        Text('Enter User password'),
                      ],
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                AppButton(
                  title: 'register',
                  onPressed: () async {
                    if (nameController.text.isEmpty || photo == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('من فضلك ادخل الاسم واختار صورة'),
                        ),
                      );
                      return;
                    }
                    addUserData();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
