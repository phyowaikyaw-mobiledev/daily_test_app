  import 'package:flutter/material.dart';
  import 'package:daily_test_app/note_list_screen.dart';
  import 'package:daily_test_app/task_detail_screen.dart';

  void main(){
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: NoteListScreen(),
      );
    }
  }
