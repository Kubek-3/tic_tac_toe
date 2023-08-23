import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/infobox_style.dart';

class InfoboxWidget extends StatelessWidget {
  const InfoboxWidget(this.text, this.color, {super.key});

  final String text;
  final Color color;

  @override
  Widget build(context) {
    return SizedBox(
      width: 300,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: infoBoxStyle,
          ),
        ),
      ),
    );
  }
}
