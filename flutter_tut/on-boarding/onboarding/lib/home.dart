import 'package:flutter/material.dart';

// import 'package:onboarding/toDo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: const Color(0xFFFF90BB),
            child: Image.asset('assets/img/get_started.webp'),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                key: const Key('getStartedButton'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/toDo');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF2171),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Button border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 12),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )))
        ],
      ),
    );
  }
}
