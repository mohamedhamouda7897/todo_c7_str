import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_str/modules/tasks_list/task_item.dart';
import 'package:todo_c7_str/shared/styles/colors.dart';

import '../../models/task.dart';
import '../../shared/network/local/firebase_utils.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: currentDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              currentDate = date;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: colorBlack,
            dayColor: colorBlack,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: lightprimary,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          StreamBuilder<QuerySnapshot<Task>>(
              stream: getDataFromFirestore(currentDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                var tasks =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                return Expanded(
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskItem(tasks[index]);
                      }),
                );
              })
        ],
      ),
    );
  }
}
