
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty_app/app_strings.dart';
import 'package:taskaty_app/taskaty.dart';
import 'models/task_model.dart';
import 'models/user_model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.deleteBoxFromDisk(AppStrings.userBox);
  await Hive.openBox<UserModel>(AppStrings.userBox);
  await Hive.openBox<TaskModel>(AppStrings.tasksBox);
  runApp(Taskaty());
}