import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text(
            'Create New Task',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0 // Make the heading bold
                ),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Main Task Name'),
            const SizedBox(height: 10),
            _buildDateField('Due Date', context),
            const SizedBox(height: 10),
            _buildTextField('Description'),
            const SizedBox(height: 20),
            Container(
              width: 20,
              child: ElevatedButton(
                onPressed: () {
                  // task creation logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF2171),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: const Text('Add Task',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold, // Make the title bold
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(20), // Make the text box more rounded
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.1), // Add shadow to the text box
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(String label, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold, // Make the title bold
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(20), // Make the text box more rounded
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.1), // Add shadow to the text box
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(15),
              suffixIcon: IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(Icons.calendar_today, color: Colors.pink),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // handle selected date
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: CreateTaskPage(),
  ));
}
