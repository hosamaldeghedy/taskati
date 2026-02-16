import 'package:flutter/material.dart';

import '../screens/add_task_screen.dart';
import 'add_task_btn.dart';
class DateAndAddTaskRow extends StatelessWidget {

  final void Function() onPressed;
  const DateAndAddTaskRow({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'October 30, 2023',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        InkWell(child:

        AddTaskBtn ( onPressed: onPressed))   ,

      ],
    ) ;
  }
}
