import 'package:flutter/material.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({super.key});

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  int _counter = 0;

  void increaseCounter() {
    setState(() {
      _counter = (_counter + 1) % 11;
    });
  }

  void decreaseCounter() {
    setState(() {
      _counter = (_counter - 1) % 11;
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$_counter",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100), // Added SizedBox to create spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: increaseCounter,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  padding: const EdgeInsets.all(20),
                  textStyle:
                      const TextStyle(fontSize: 20, color: Colors.white)),
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: decreaseCounter,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  padding: const EdgeInsets.all(20),
                  textStyle:
                      const TextStyle(fontSize: 20, color: Colors.white)),
              child: const Text('-'),
            ),
          ],
        ),
        const SizedBox(height: 100), // Added SizedBox to create spacing
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Dynamic List')),
      body: const DynamicList(),
    ),
  ));
}
