import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Circular Counter',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.pink[100],
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              color: Colors.pink[300],
              padding: const EdgeInsets.all(20),
              child: const Text("Box 1")),
          Container(
              color: Colors.pink[200],
              padding: const EdgeInsets.all(20),
              child: const Text("Box 2")),
        ]));
  }
}

// containers, act as wrappers to other widgets