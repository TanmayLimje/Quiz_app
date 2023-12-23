import 'package:flutter/material.dart';
//import 'package:quiz_app/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz.jpeg',
            width: 350,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Lets take a quiz shall we?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.horizontal())),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Continue")),
        ],
      ),
    );
  }
}
