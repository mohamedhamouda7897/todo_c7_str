import 'package:flutter/material.dart';
import 'package:todo_c7_str/modules/settings/settings.dart';
import 'package:todo_c7_str/modules/tasks_list/tasks_list.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'HOme';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extend all content under bottom nav bar and floating action buttton

      appBar: AppBar(
        title: Text('Route Tasks'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 3)),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [TasksScreen(), SettingsScreen()];
}
