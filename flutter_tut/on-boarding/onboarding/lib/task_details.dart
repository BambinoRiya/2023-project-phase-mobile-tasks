import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onboarding/models/task_class.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({
    super.key,
  });

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  late DateTime editDate; //remove this late
  String? editTitle, editDescription;
  TaskStatus? status;

  void populateFromTask(task) {
    if (editTitle == null) {
      editDate = task.dueDate;
      editTitle = task.taskName;
      editDescription = task.description;
      status = task.status;
    }
  }

  void showingDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    DateTime lastDate = DateTime(now.year + 1, now.month, now.day);
    final date = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      barrierColor: Color.fromARGB(255, 238, 101, 151),
    );
    if (date != null) {
      setState(() {
        editDate = date;
      });
    }
  }

  String formatDate(DateTime dateTime) {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;
    populateFromTask(task);

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
            color: Color(0xFFFF2171),
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 35,
            color: Color(0xFFFF2171),
          )
        ],
        title: const Text(
          'Task Detail',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 35),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/img/to_do.png',
                    width: 250,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.only(left: 8),
                  child: const Text('Title', style: TextStyle(fontSize: 15)),
                ),
                TextField(
                  onChanged: (value) {
                    editTitle = value;
                  },
                  controller: TextEditingController(text: editTitle),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(241, 238, 238, 1),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 17),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: null,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.only(left: 8),
                  child:
                      const Text("Description", style: TextStyle(fontSize: 15)),
                ),
                TextField(
                  onChanged: (value) {
                    editDescription = value;
                  },
                  controller: TextEditingController(text: editDescription),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(241, 238, 238, 1),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 17),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: null,
                  style: const TextStyle(fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5, top: 15),
                  padding: const EdgeInsets.only(left: 8),
                  child: const Text("Due date", style: TextStyle(fontSize: 15)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(241, 238, 238, 1),
                  ),
                  width: double.infinity, //what?
                  margin: const EdgeInsets.only(bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDate(editDate),
                        style: TextStyle(fontSize: 15),
                      ),
                      IconButton(
                        onPressed: () {
                          showingDatePicker();
                        },
                        icon: const Icon(Icons.date_range),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.only(left: 8),
                  child: const Text(
                    'Status',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                DropdownButtonFormField<TaskStatus>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(241, 238, 238, 1),
                  ),
                  dropdownColor: const Color.fromRGBO(241, 238, 238, 1),
                  value: status,
                  onChanged: (TaskStatus? newValue) {
                    setState(() {
                      status = newValue!;
                    });
                  },
                  itemHeight: 50,
                  items: TaskStatus.values
                  .map((status) => DropdownMenuItem(
                    value: status,
                    child: Text(
                      status.name.toString().toUpperCase(),
                    ),
                    )).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 60),
                      backgroundColor: const Color(0xFFFF2171),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Map<String, Object> data = {
                        'title': editTitle!,
                        'description': editDescription!,
                        'date': editDate,
                        'status': status!,
                      };
                      Navigator.pop(context, data);
                    },
                    child: const Text(
                      'Save task',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
