import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/quiz_Question.dart';
import 'package:quizapp/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  List<Map<String, Object>> getsummmeryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'user-answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final summaryData = getsummmeryData();
    final numTotalQuastion = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['user-answer'] == data['correctAnswer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'you answer $numCorrectAnswer out of $numTotalQuastion questions'),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getsummmeryData()),
            TextButton(
              onPressed: () {},
              child: const Text("Restart quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
