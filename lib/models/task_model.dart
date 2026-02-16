
import 'package:flutter/material.dart';

class TaskModel {
  String taskTitle;
  String taskDate;
  String taskStartTime;
  String taskEndTime;
  String taskDescription;
  Color taskColor;
  String taskStatus;

  TaskModel ({required this.taskTitle,required this.taskDate,required this.taskStartTime,
      required this.taskEndTime, required this.taskDescription, required this.taskColor,required this.taskStatus});

}

List <TaskModel> tasks =[

]  ;