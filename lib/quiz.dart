import 'package:flutter/material.dart';
import 'package:quizapp/startScreen.dart';
import 'package:quizapp/questionScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var activeScreen = 'Start-Screen';
  @override
  void SwitchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  @override
  Widget build(context) {
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
          child: activeScreen == 'Start-Screen'
              ? StartScreen(SwitchScreen)
              : QuestionScreen(),
        ),
      ),
    );
  }
}
