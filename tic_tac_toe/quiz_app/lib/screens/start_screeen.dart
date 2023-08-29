import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/text_widget.dart';

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
            'assets/images/logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 64),
          const TextWidget(
            text: 'Learn Flutter',
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const TextWidget(
              text: 'Start Quiz',
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
