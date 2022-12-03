import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_str/modules/tasks_list/task_item.dart';
import 'package:todo_c7_str/shared/styles/colors.dart';

import '../../models/task.dart';
import '../../shared/network/local/firebase_utils.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: colorBlack,
            dayColor: colorBlack,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: lightprimary,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: FutureBuilder<QuerySnapshot<Task>>(
              future: getDataFromFireStore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Somethis went wrong'));
                }
                List<Task> tasksData =
                    snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                    itemCount: tasksData.length,
                    itemBuilder: (c, index) {
                      return TaskItem(tasksData[index]);
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
