
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)

class TaskModel extends HiveObject {
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  String taskDate;
  @HiveField(2)
  String taskStartTime;
  @HiveField(3)
  String taskEndTime;
  @HiveField(4)
  String taskDescription;
  @HiveField(5)
  int taskColor;
  @HiveField(6)
  String taskStatus;

  TaskModel ({required this.taskTitle,required this.taskDate,required this.taskStartTime,
      required this.taskEndTime, required this.taskDescription, required this.taskColor,required this.taskStatus});

}
