// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/scoreboard_style.dart';
import 'package:tic_tac_toe/widgets/basic_widget.dart';

class EndgameWidget extends StatelessWidget {
  const EndgameWidget(this.onPressed, this.text, this.dispalyValue,
      {super.key});

  final String text;
  final Function(List) onPressed;
  final List dispalyValue;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BasicWidget(
          text,
          const Color.fromRGBO(207, 216, 220, 1),
        ),
        const SizedBox(height: 24),
        Card(
          color: Colors.blueGrey[100],
          child: TextButton(
            onPressed: () {
              onPressed(dispalyValue);
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                style: scoreboardTextStyle,
                'Play again',
              ),
            ),
          ),
        ),
      ],
    );
  }
}