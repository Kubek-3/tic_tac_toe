import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/text_widget.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.answersColors, this.chosenAnswers, this.onPressed,
      {super.key});

  final List<Color> answersColors;
  final List<String> chosenAnswers;
  final void Function() onPressed;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'answers_color': answersColors[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions corretcly',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          QuestionSummary(getSummaryData()),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(
              Icons.replay_sharp,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            label: const TextWidget(
              text: 'Start Again',
              color: Colors.white,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
