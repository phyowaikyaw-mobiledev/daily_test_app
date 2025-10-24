  import 'package:flutter/material.dart';

  class TaskDetailScreen extends StatelessWidget {
    final Map<String, dynamic> task;
    const TaskDetailScreen({super.key, required this.task});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(task['title']),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(task['description']),
          ],
        ),


      );
    }
  }
