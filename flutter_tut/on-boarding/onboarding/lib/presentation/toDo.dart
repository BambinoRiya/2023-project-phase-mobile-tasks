import 'package:flutter/material.dart';
import 'package:onboarding/presentation/add_task.dart';
import 'package:onboarding/presentation/cards.dart';
import 'package:onboarding/models/task_class.dart';
import 'dart:math';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];
  final List<Color> _randomColors = [Colors.red, Colors.green, Colors.pink];

  void editTask(Map<String, Object> map, Task task) {
    setState(() {
      task.taskName = map['title'] as String;
      task.description = map['description'] as String;
      task.dueDate = map['date'] as DateTime;
      task.status = map['status'] as TaskStatus;

      int index = tasks.indexWhere((t) => t == task);
      if (index != -1) {
        tasks[index] = task;
      }
    });
  }

  Color getRandomColor() {
    return _randomColors[Random().nextInt(3)];
  }

  void addTask(Map<String, Object?> value) {
    setState(() {
      tasks.add(
        Task(
            taskName: value['title'] as String,
            description: value['description'] as String,
            dueDate: value['date'] as DateTime,
            status: value['status'] as TaskStatus),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 35,
              color: Color.fromRGBO(238, 101, 151, 1),
            ),
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              size: 35,
            ),
          ],
          title: const Text(
            'Todo List',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        key: const Key('Task List Pic'),
                        child: Image.asset(
                          'assets/img/stickman.png',
                          width: 360,
                          height: 300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: Text(
                          'Task List',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ...tasks.reversed.map(
                            (task) => TaskCard(
                              key: Key(task.taskName),
                              task: task,
                              color: _randomColors[task.status.index],
                              editTask: editTask,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: ElevatedButton(
                      key: const Key('Create task'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 79, 132),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        Map<String, Object>? value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateTaskPage(),
                          ),
                        );
                        if (value != null) {
                          addTask(value);
                        }
                      },
                      child: const Text(
                        'Create Task',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
