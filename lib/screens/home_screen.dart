import 'package:flutter/material.dart';
import 'package:taskaty_app/widgets/add_task_btn.dart';
import 'package:taskaty_app/widgets/date.dart';
import 'package:taskaty_app/widgets/task_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text('Hello Hossam Adel Mohammed Aldeghedy', style: TextStyle(
                        color: Colors.black,
                        fontSize: 22), maxLines: 1 , overflow: TextOverflow.ellipsis,
                    ),
                        Text('Have a nice day',
                        style: TextStyle(
                          fontSize: 18 ,
                        ),
                        )],
                    ),
                  ),
                SizedBox(width: 10,) ,
                  CircleAvatar(radius: 50,backgroundImage: Image.network('https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg').image ,
                  )
                  ,
                  SizedBox(height: 10,) ,
                ],
              ),
              SizedBox(height: 10,) ,
      Row(
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
          InkWell(child: AddTaskBtn ( onPressed: () {

          } ))   ,

        ],
      ),
              SizedBox(height: 10,) ,
              Row(
                children: [
                  Date(
                    month: 'OCT',
                    day: '29',
                    week: 'mon',
                    isSelected: selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Date(
                    month: 'OCT',
                    day: '31',
                    week: 'Tue',
                    isSelected: selectedIndex == 1,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Date(
                    month: 'nov',
                    day: '1',
                    week: 'wed',
                    isSelected: selectedIndex == 2,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Date(
                    month: 'nov',
                    day: '2',
                    week: 'thu',
                    isSelected: selectedIndex == 3,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  children: [
                    TaskContainer(color: Colors.blue, title: 'Task 1', description: 'i will do this task', time: '2:25am-2:40am',),
                    SizedBox(height: 5),
                    TaskContainer(color: Colors.pink, title: 'Task 2', description: 'i will do this task', time: '4:27pm-6:42pm',),
                    SizedBox(height: 5),
                    TaskContainer(color: Colors.deepOrange, title: 'Task 3', description: 'i will do this task', time: '7:27pm-9:43pm',),
                  ]

                ),
              )
            ],
          ),

        ),

      ),

    );
  }
}
