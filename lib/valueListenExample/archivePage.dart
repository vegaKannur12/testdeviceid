import 'package:flutter/material.dart';
import 'package:tesdeviceid/valueListenExample/homepage.dart';

// archive_page.dart

// import './home_page.dart';

// This screen only display completed tasks
class ArchivePage extends StatelessWidget {
  // Change a task from "completed" to "uncompleted"
  void _uncheckTask(String updatedTaskId) {
    final List<Map<String, dynamic>> tasks = [...HomePage.tasksNotifier.value];

    final int index = tasks.indexWhere((task) => task['id'] == updatedTaskId);
    tasks[index]['isDone'] = false;

    HomePage.tasksNotifier.value = tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archive Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder<List<Map<String, dynamic>>>(
          valueListenable: HomePage.tasksNotifier,
          builder: (_, tasks, __) {
            final completedTasks =
                tasks.where((task) => task['isDone'] == true).toList();
            return ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (_, index) => Card(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  elevation: 5,
                  color: Colors.pinkAccent,
                  child: ListTile(
                    title: Text(completedTasks[index]['title']),
                    trailing: IconButton(
                      icon: Icon(Icons.check_box),
                      onPressed: () =>
                          _uncheckTask(completedTasks[index]['id']),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}