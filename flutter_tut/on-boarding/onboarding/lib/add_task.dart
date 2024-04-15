import 'package:flutter/material.dart';
import 'package:onboarding/task_details.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              // Add date selection logic here
                            },
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
                      const SizedBox(height: 40),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 55,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 224, 79, 132),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/task_detail');
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
