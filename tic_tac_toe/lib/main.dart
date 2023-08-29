import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      home: const HomePage(),
    ),
  );
}