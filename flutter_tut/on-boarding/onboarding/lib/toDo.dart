import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onboarding/add_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 35,
            color:  Color.fromARGB(255, 238, 101, 151),
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 35,
          )
        ],
        title: const Text(
          'Todo List',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Task Text',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Description',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Time',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      'Main Heading 2',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    subtitle: Text('Description 2'),
                    leading: Icon(
                      Icons.abc_rounded,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      'Main Heading 3',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    subtitle: Text('Description 3'),
                    leading: Icon(
                      Icons.abc_rounded,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateTaskPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF2171),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                ),
                child: const Text(
                  'Create task',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
