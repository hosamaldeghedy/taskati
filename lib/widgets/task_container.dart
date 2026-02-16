import 'package:flutter/material.dart';
import 'package:taskaty_app/models/task_model.dart';
class TaskContainer extends StatelessWidget {
  final TaskModel task;

  const TaskContainer({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 120,
        width: double.infinity,

        decoration: BoxDecoration(
          color: task.taskColor,
          borderRadius: BorderRadius.circular(22),
        ) ,


        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  task.taskTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      '${task.taskStartTime} - ${task.taskEndTime}',
                      style: TextStyle(
                        color: Colors.white ,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),


                    Spacer(),

                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.white ,
                      margin: const EdgeInsets.symmetric(horizontal: 16),

                    ),
                    Center(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child:  Text(
                          task.taskStatus,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  task.taskDescription,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              ],

            ),
          ),
        )


























      //
      // Row(
      //     children: [
      //       Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 title,
      //                 style: const TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //               const SizedBox(height: 12),
      //               Row(
      //                 children: [
      //                   const Icon(Icons.access_time, color: Colors.white, size: 18),
      //                   const SizedBox(width: 8),
      //                   Text(
      //                     time,
      //                     style: TextStyle(
      //                       color: Colors.white.withOpacity(0.92),
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(height: 12),
      //               Text(
      //                 description,
      //                 style: const TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 14,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         width: 64,
      //         child: Stack(
      //           children: [
      //             Positioned(
      //               left: 18,
      //               top: 14,
      //               bottom: 14,
      //               child: Container(
      //                 width: 1,
      //                 color: Colors.white.withOpacity(0.85),
      //               ),
      //             ),
      //             Center(
      //               child: RotatedBox(
      //                 quarterTurns: 3,
      //                 child: const Text(
      //                   'TODO',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w700,
      //                     letterSpacing: 2,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      //
      // );
      //     // children: [Center(
      //     //   child: RotatedBox(
      //     //     quarterTurns: 3,
      //     //     child: const Text(
      //     //       'TODO',
      //     //       style: TextStyle(
      //     //         color: Colors.white,
      //     //         fontSize: 14,
      //     //         fontWeight: FontWeight.w700,
      //     //         letterSpacing: 2,
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),]





    ); }
}
