import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onboarding/data/models/task_class.dart';
import 'package:dartz/dartz.dart' as dartz;

final _taskNameController = TextEditingController();
final _dateController = TextEditingController();
final _descriptionController = TextEditingController();

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _taskName = "";
  String _description = "";
  TaskStatus _status = TaskStatus.pending;

  String formatDate(DateTime dateTime) {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(dateTime);
  }

  dartz.Either<String, bool> isValid() {
    if (_taskName != "" && _description != "") {
      return const dartz.Right(true);
    }
    return const dartz.Left("Please fill all fields!");
  }

  void showingDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    DateTime lastDate = DateTime(now.year + 1, now.month, now.day);
    final date = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      barrierColor: const Color.fromARGB(255, 238, 101, 151),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
        _dateController.text = formatDate(date);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 252, 252),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 35,
            color: Color.fromARGB(255, 238, 101, 151),
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 35,
            color: Color.fromARGB(255, 238, 101, 151),
          )
        ],
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 0), // Adjust the spacing as needed
            const Center(
              child: Text(
                "Create new task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 35),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'Main task name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 238, 101, 151),
                          ),
                        ),
                      ),
                      TextField(
                        key: const Key('taskTitleField'),
                        controller: _taskNameController,
                        onChanged: (value) {
                          setState(() {
                            _taskName = value;
                            isValid();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 17,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey[400]!, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey[400]!, width: 1),
                          ),
                          hintText: '',
                        ),
                        maxLines: null,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        //container that needs row
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'Due date',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 238, 101, 151),
                          ),
                        ),
                      ),
                      TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 17,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey[400]!, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey[400]!, width: 1),
                          ),
                          hintText: _selectedDate.toString().split(' ')[0],
                          suffixIcon: IconButton(
                            onPressed: showingDatePicker,
                            icon: const Icon(Icons.date_range),
                          ),
                        ),
                        maxLines: null,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 238, 101, 151),
                          ),
                        ),
                      ),
                      TextField(
                        key: const Key('taskDescription'),
                        controller: _descriptionController,
                        onChanged: (value) {
                          setState(() {
                            _description = value;
                            isValid();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 17,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey[400]!, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey[400]!, width: 1),
                          ),
                          hintText: '',
                        ),
                        maxLines: null,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'Status',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 238, 101, 151),
                          ),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: _status,
                          onChanged: (newValue) {
                            setState(() {
                              _status = newValue as TaskStatus;
                            });
                          },
                          items: TaskStatus.values
                              .map<DropdownMenuItem<TaskStatus>>(
                                (TaskStatus value) =>
                                    DropdownMenuItem<TaskStatus>(
                                  value: value,
                                  child: Text(
                                    value.name,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: ElevatedButton(
                          key: const Key('addTaskButton'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 55,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 224, 79, 132),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            final validData = isValid();

                            validData.fold((error) {
                              showDialog(
                                context: context,
                                builder: (BuildContext ctx) => AlertDialog(
                                  title: const Text("Invalid input!",
                                      style: TextStyle(color: Colors.pinkAccent)),
                                  content: Text(error),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: const Text("Close"))
                                  ],
                                ),
                              );
                            }, (value) {
                              Map<String, Object> data = {
                                'title': _taskName,
                                'description': _description,
                                'date': _selectedDate,
                                'status': _status,
                              };
                              Navigator.pop(context, data);
                            });
                          },
                          child: const Text(
                            'Add task',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
