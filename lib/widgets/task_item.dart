import 'package:flutter/material.dart';
import 'package:taskaty_app/models/task_model.dart';
import 'package:taskaty_app/widgets/task_container.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onDelete;
  const  TaskItem({super.key, required this.task, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return
      Dismissible(

      key: UniqueKey(),
      direction: DismissDirection.endToStart,
        onDismissed: (_) {
          tasks.removeAt(tasks.indexOf(task));
          onDelete();
        },

      child: TaskContainer(task: task),
    );
  }
}
