import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {Key? key}) : super(key: key);
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map<Widget>((data) {
            final bool isCorrect = data['user-answer'] == data['correctAnswer'];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Styling the question number as circular
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 30, // Adjust according to your preference
                    height: 30, // Adjust according to your preference
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        ((data['questionIndex'] as int) + 1).toString(),
                        style: GoogleFonts.dmSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Adjust spacing as needed
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15, top: 5),
                          child: Text(
                            data['question'] as String,
                            style: GoogleFonts.ibmPlexSansHebrew(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Text(
                          data['user-answer'] as String,
                          style: GoogleFonts.ibmPlexSansCondensed(
                            color: isCorrect ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['correctAnswer'] as String,
                          style: GoogleFonts.ibmPlexSansCondensed(
                            color: Colors.green, // Correct answer color
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
