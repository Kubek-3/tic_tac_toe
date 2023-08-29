import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/circle_widget.dart';
import 'package:quiz_app/widgets/text_widget.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleWidget(
                      answerColor: (data['answers_color'] as Color),
                      text: ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: data['question'] as String,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        TextWidget(
                          text: 'Your answer: ${data['user_answer'] as String}',
                          size: 14,
                          color: (data['answers_color'] as Color),
                        ),
                        TextWidget(
                            text:
                                'Correct answer: ${(data['correct_answer']) as String}',
                            size: 14,
                            color: ((data['answers_color']) as Color)),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
