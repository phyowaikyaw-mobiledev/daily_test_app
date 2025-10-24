  import 'package:flutter/material.dart';
  import 'package:daily_test_app/task_detail_screen.dart';

  class NoteListScreen extends StatefulWidget {
    const NoteListScreen({super.key});

    @override
    State<NoteListScreen> createState() => _NoteListScreenState();
  }

  class _NoteListScreenState extends State<NoteListScreen> {
    List <Map<String,dynamic>> tasks = [];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Daily Test "),
          backgroundColor: Colors.yellowAccent,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
            Map<String,dynamic> task = {
              'status': false,
            };
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Create New Task"),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (title) {
                            task['title'] = title;
                          },
                          decoration: InputDecoration(
                            label: Text("task title"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            onChanged: (description) {
                              task['description'] = description;
                            },
                            minLines: 5,
                            maxLines: 10,
                            decoration: InputDecoration(
                              label: Text("task description"),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              tasks.add(task);
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Save"),
                        ),
                      ],
                    ),
                  ),


                )
            );
        },
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            for (Map<String, dynamic> task in tasks)
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailScreen(task: task)));
                },
                leading: InkWell(
                    onTap: () {
                      setState(() {
                        task['status'] = !task['status'];
                      });
                    },
                    child: Icon(task['status'] ? Icons.check_box : Icons.check_box_outline_blank)),
                title: Text(
                  task['title'],
                  style: TextStyle(
                    decoration: task['status'] ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  task['description'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_outlined),
              ),


          ],
        ),
      );
    }
  }

