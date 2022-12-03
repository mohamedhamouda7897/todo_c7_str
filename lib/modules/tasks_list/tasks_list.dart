import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_str/modules/tasks_list/task_item.dart';
import 'package:todo_c7_str/shared/styles/colors.dart';

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
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (c, index) {
                  return TaskItem();
                }),
          ),
        ],
      ),
    );
  }
}
