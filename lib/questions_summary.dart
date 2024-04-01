import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text(((data['questionIndex'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String),
                    Text(data['user-answer'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['correctAnswer'] as String)
                  ],
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
