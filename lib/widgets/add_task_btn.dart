import 'package:flutter/material.dart';

class AddTaskBtn extends StatelessWidget {

  const AddTaskBtn({super.key, required this.onPressed});
  final void Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(




        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          minimumSize: Size (40,50) ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

        ),

        onPressed: onPressed,

        child:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add
            ,color: Colors.white,),
            Text( 'Add Task' ,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white )
            )

          ],
    ) ,



    ) ;
  }
}
