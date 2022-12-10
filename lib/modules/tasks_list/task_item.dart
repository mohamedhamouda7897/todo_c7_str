import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_c7_str/shared/components/components.dart';
import 'package:todo_c7_str/shared/styles/colors.dart';

import '../../models/task.dart';
import '../../shared/network/local/firebase_utils.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            deleteTaskFromFireStore(task.id).then((value) {
              showMessage(context, 'Done', 'Ok', () {
                hideLoading(context);
              }, 'Deleted', false);
            });
          },
          icon: Icons.delete,
          label: 'Delete',
          backgroundColor: Colors.red,
        ),
        SlidableAction(
          onPressed: (context) {},
          icon: Icons.edit,
          label: 'Edit',
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
          backgroundColor: Colors.blue,
        )
      ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 4),
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
                    task.title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(task.description)
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
