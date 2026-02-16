import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskaty_app/models/task_model.dart';
import 'package:taskaty_app/widgets/app_button.dart';
import 'package:taskaty_app/widgets/app_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {

  const AddTaskScreen({super.key });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
    List<Color> colors = [Colors.red, Colors.deepPurple, Colors.green , Colors.blue, Colors.orange, Colors.pink];
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();
     int activeColorIndex = -1;
  TimeOfDay? startTime;
  TimeOfDay? endTime;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        titleTextStyle: TextStyle(
          color: Colors.deepPurple,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.deepPurple),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AppTextFormField(
                  labelText: 'Task Title',
                  hintText: 'enter task title', controller: titleController,
                ),
                SizedBox(height: 10),
                Text (
                  'description',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                AppTextFormField(
                  labelText: 'description',
                  maxLines: 3,
                  hintText: 'enter task description', controller: descriptionController,
                ),
                SizedBox(height: 10),
                Text(
                  'date and time',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AppTextFormField(

                  isReadOnly: true,
                  suffixIcon: Icon(Icons.date_range, color: Colors.deepPurple),
                  labelText: 'Date',
                  hintText: '14/2/2026',
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2029),
                      barrierDismissible: false,
                    ).then((value) {
                      dateController.text =DateFormat.yMd().format(value??DateTime.now()).toString();
                    });
                  }, controller: dateController,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'start time',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 16),
                          AppTextFormField(
                            isReadOnly: true,
                            suffixIcon: Icon(
                              Icons.alarm,
                              color: Colors.deepPurple,
                            ),
                            labelText: 'start',
                            hintText: '12:00 PM',
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value != null) {
                                  startTime = value;
                                  startTimeController.text = value.format(context);
                                }
                              });
                            },
                            controller: startTimeController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'end time',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 16),
                          AppTextFormField(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value != null) {
                                  endTime = value;
                                  endTimeController.text = value.format(context);
                                }
                              });
                            },
                            controller: endTimeController,
                            isReadOnly: true,
                            suffixIcon: Icon(
                              Icons.alarm,
                              color: Colors.deepPurple,
                            ),
                            labelText: 'end',
                            hintText: '12:00 PM',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                    children: List.generate(colors.length, (index)=>InkWell(
                      onTap: (){
                        setState(() {
                          activeColorIndex = index;

                        });
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: colors[index],
                        child:activeColorIndex==index? Icon(Icons.check, color: Colors.white, size: 30):null ,
                      ),
                    ))
                ),
                SizedBox(height: 30),
                AppButton(title: 'Create Task', onPressed: (){
                  if (startTime != null && endTime != null) {
                    if (endTime!.hour < startTime!.hour ||
                        (endTime!.hour == startTime!.hour && endTime!.minute <= startTime!.minute)) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Error'),
                          content: Text('End time must be after start time'),
                        ),
                      );
                      return;
                    }
                  }


                  if( (formKey.currentState?.validate()??false)) {
                   if (activeColorIndex==-1){
                     showDialog(context: context, builder: (context)=>
                         AlertDialog(
                           title: Text('please select task color'),
                           content: Text('please select color'),
                         )
                     );
                     return;
                   }
                   tasks.add(TaskModel(
                     taskTitle: titleController.text,
                     taskDescription: descriptionController.text,
                     taskDate: dateController.text,
                     taskStartTime: startTimeController.text,
                     taskEndTime: endTimeController.text,
                     taskColor: colors[activeColorIndex],
                     taskStatus: 'TODO',

                   ));
                   Navigator.pop(context);
                 }
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
