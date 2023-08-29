// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/scoreboard_style.dart';

class BasicWidget extends StatelessWidget {
  BasicWidget(this.text, this.color, {super.key});

  String text;
  final Color color;

  @override
  Widget build(context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: scoreboardTextStyle,
        ),
      ),
    );
  }
}
