import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {required this.size, required this.color, required this.text, super.key});

  final double size;
  final Color color;
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
        textStyle: TextStyle(
          color: color,
          letterSpacing: .5,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
