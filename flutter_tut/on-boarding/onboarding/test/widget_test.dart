import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding/presentation/main.dart';
import 'package:onboarding/presentation/home.dart';
import 'package:onboarding/presentation/add_task.dart';
import 'package:onboarding/presentation/task_details.dart';
import 'package:onboarding/presentation/toDo.dart';

void main() {
  testWidgets('Test Onboarding Page Navigation ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: <String, WidgetBuilder>{
        '/toDo': (BuildContext context) => const HomePage(),
        '/add_task': (BuildContext context) => const CreateTaskPage(),
        '/task_detail': (BuildContext context) => const TaskDetail(),
      },
      home: const WelcomePage(),
    ));
    final getStartedButton = find.byKey(const Key('getStartedButton'));
    await tester.tap(getStartedButton);

    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('Test Adding Task', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/add_task',
      routes: <String, WidgetBuilder>{
        '/add_task': (BuildContext context) => const CreateTaskPage(),
        '/toDo': (BuildContext context) => const HomePage(),
      },
    ));
    // expect(find.text('Add Task'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('taskTitleField')), 'Task Title');

    await tester.enterText(
        find.byKey(const Key('taskDescription')), 'Task Descriotion');

    final addTaskButton = find.byKey(const Key('addTaskButton'));
    expect(addTaskButton, findsOneWidget);

    await tester.tap(addTaskButton);
    await tester.pump();
  });
}
