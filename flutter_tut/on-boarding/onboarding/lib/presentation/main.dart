import 'package:flutter/material.dart';
import 'package:onboarding/presentation/home.dart';
import 'package:onboarding/presentation/add_task.dart';
import 'package:onboarding/presentation/task_details.dart';
import 'package:onboarding/presentation/toDo.dart';

void main() {
  runApp(
    MaterialApp(
      home: const WelcomePage(),
      routes: <String, WidgetBuilder>{
        '/toDo': (BuildContext context) => const HomePage(),
        '/add_task': (BuildContext context) => const CreateTaskPage(),
        '/task_detail': (BuildContext context) => const TaskDetail(),
      },
    ),
  );
}
