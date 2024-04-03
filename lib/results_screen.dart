import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/quiz_Question.dart';
import 'package:quizapp/questions_summary.dart';
import 'package:quizapp/quiz.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final List<String> chosenAnswers;
  final VoidCallback onRestart;
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
    final numTotalQuestions = questions.length;
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
              'You answered $numCorrectAnswer out of $numTotalQuestions questions',
              style: GoogleFonts.ibmPlexSansHebrew(
                  color: Colors.amberAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getsummmeryData()),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(57, 197, 136, 255),
                ),
              ),
              onPressed: onRestart,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Restart quiz",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
