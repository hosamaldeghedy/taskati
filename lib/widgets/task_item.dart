import 'package:flutter/material.dart';
import 'package:taskaty_app/widgets/task_container.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Handle task deletion here
      },

      child: TaskContainer(
        color: Colors.deepPurple,
        title: 'Task Title',
        description: 'I will do this task',
        time: '2:25am-2:40am',
      ),
    );
  }
}
