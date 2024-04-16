import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onboarding/models/task_class.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.color,
    required this.task,
    required this.editTask,
  });

  final Task task;
  final Color color;
  final void Function(Map<String, Object>, Task) editTask;

  String formatDate(DateTime dateTime) {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final value = await Navigator.pushNamed(
          context,
          '/task_detail',
          arguments: task,
        ) as Map<String, Object>?;

        if (value != null) {
          editTask(value, task);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
          child: ListTile(
            leading: const Text(
              "U",
              style: TextStyle(fontSize: 25),
            ),
            title: SizedBox(
              width: 150,
              child: Text(
                task.taskName,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            trailing: SizedBox(
              width: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formatDate(task.dueDate)),
                  const SizedBox(width: 10),
                  Container(
                    width: 4,
                    height: 40,
                    color: color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
