import 'package:flutter/material.dart';
import 'package:taskaty_app/widgets/app_button.dart';
import 'package:taskaty_app/widgets/app_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
   const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
    List<Color> colors = [Colors.red, Colors.deepPurple, Colors.green];
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
                  hintText: 'enter task title',
                ),
                SizedBox(height: 10),
                Text(
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
                  hintText: 'enter task description',
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
                    );
                  },
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
                            onTap: (){
                              showTimePicker(context: context, initialTime: TimeOfDay.now());
                            },
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

                            onTap: (){
                              showTimePicker(context: context, initialTime: TimeOfDay.now());
                            },
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
                    children: List.generate(3, (index)=>CircleAvatar(
                      radius: 30,
                      backgroundColor: colors[index],
                    ))
                ),
                SizedBox(height: 30),
                AppButton(title: 'Create Task', onPressed: (){
                  formKey.currentState?.validate();
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
