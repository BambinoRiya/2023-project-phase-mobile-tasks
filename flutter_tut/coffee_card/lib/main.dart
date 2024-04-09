// import 'package:coffee_card/home.dart';
// import 'package:coffee_card/home.dart';
import 'package:coffee_card/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DynamicList()));
}

class SandBox extends StatelessWidget {
  //practice code
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Circular Counter'), backgroundColor: Colors.pink),
    );
  }
}
