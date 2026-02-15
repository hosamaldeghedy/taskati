import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskaty_app/widgets/date_and_add_task_row.dart';
import 'package:taskaty_app/widgets/date_container.dart';
import 'package:taskaty_app/widgets/home_app_bar.dart';
import 'package:taskaty_app/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final File userImage;
  const HomeScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              HomeAppBar(
                userName: widget.userName,
                userImage: widget.userImage,
              ),
              SizedBox(height: 10),
              DateAndAddTaskRow(),
              SizedBox(height: 10),
              Row(
                spacing: 15,
                children: [
                  DateContainer(
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
                  DateContainer(
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
                  DateContainer(
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
                  DateContainer(
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
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => TaskItem(),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 10),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
