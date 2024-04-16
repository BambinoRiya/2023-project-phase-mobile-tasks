import 'package:flutter/material.dart';
import 'package:onboarding/cards.dart';
import 'package:onboarding/models/task_class.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];
  List<Color> randomColors = [Colors.red, Colors.green, Colors.pink];

  void editTask(Map<String, Object> map, Task task) {
    setState(() {
      task.taskName = map['title'] as String;
      task.description = map['description'] as String;
      task.dueDate = map['date'] as DateTime;
    });
  }

  Color getRandomColor() {
    return randomColors[Random().nextInt(3)];
  }

  void addTask(Map<String, Object?> value) {
    setState(() {
      tasks.add(
        Task(
          taskName: value['title'] as String,
          description: value['description'] as String,
          dueDate: value['date'] as DateTime,
        ),
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
          style: TextStyle(fontSize: 25),
          
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                child: Image.asset(
                  'assets/img/stickman.png',
                  width: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Task list',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              // Map each task to a TaskCard widget
              Column(
                children: tasks.map((task) {
                  return TaskCard(
                    key: Key(task.taskName),
                    task: task,
                    color: getRandomColor(),
                    editTask: editTask,
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_task');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF2171),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 18),
                  ),
                  child: const Text(
                    'Create task',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
