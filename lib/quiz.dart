import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/startScreen.dart';
import 'package:quizapp/questionScreen.dart';
import 'package:quizapp/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'Start-Screen';
  @override
  void SwitchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget ScreenWidget = StartScreen(SwitchScreen);
    //
    if (activeScreen == 'Questions-Screen') {
      ScreenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      ScreenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: () {
          setState(() {
            activeScreen = 'Start-Screen';
            selectedAnswers.clear(); // Clear selected answers
          });
        },
      );
    }
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 89, 12, 160),
                  Color.fromARGB(255, 39, 0, 132),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ScreenWidget),
      ),
    );
  }
}
