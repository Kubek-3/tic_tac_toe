import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/text_widget.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget(
      {required this.answerColor, required this.text, super.key});

  final Color answerColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: answerColor),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: TextWidget(
          text: text,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
