import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAns = [];

  void chooseAns(answer) {
    selectedAns.add(answer);

    if (selectedAns.length == questions.length) {
      setState(() {
        //selectedAns = [];
        activeScreen = 'result-screen';
      });
    }
  }

  var activeScreen = 'start-screen';

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    // if (activeScreen == 'result-screen') {
    //   const ResultScreen();
    // }

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAns: chooseAns);
    }

    void restartQuiz() {
      setState(() {
        selectedAns = [];
        activeScreen = 'questions-screen';
      });
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAns: selectedAns, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz-App",
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 13, 69, 239),
                  Color.fromARGB(255, 15, 255, 175),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
