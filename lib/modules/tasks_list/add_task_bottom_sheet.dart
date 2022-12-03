import 'package:flutter/material.dart';
import 'package:todo_c7_str/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  GlobalKey<FormState> keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add new Task',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(fontSize: 25, color: colorBlack),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              key: keyform,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Please Enter Task title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text('Title'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: lightprimary)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: lightprimary))),
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: descriptionController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Please Enter Task Description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text('Description'),
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: lightprimary)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: lightprimary))),
                  ),
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Text(
            'Select Date',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showDate();
            },
            child: Text(
              '${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: colorBlack),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (keyform.currentState!.validate()) {
                  // Add task to database
                }
              },
              child: Text('Add Task'))
        ],
      ),
    );
  }

  // format date Mon, 25 Oct
  void showDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(
          days: 365,
        ),
      ),
    );
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}
