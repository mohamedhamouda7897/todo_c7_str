import 'package:flutter/material.dart';
import 'package:todo_c7_str/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 80,
            color: lightprimary,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Title',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('TAsk Description')
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              // edit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: lightprimary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
