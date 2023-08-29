import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/main_column.dart';
import 'package:tic_tac_toe/widgets/endgame_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> dispalyValue = ['', '', '', '', '', '', '', '', ''];

  String playerTurn = 'O';
  bool turn = true;
  int oScore = 0;
  int xScore = 0;
  int draws = 0;
  int filledBoxes = 0;
  bool isWinner = false;
  bool whooseTurn = true;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: MainColumn(
          oScore: oScore,
          xScore: xScore,
          onTapped: _tapped,
          dispalyValue: dispalyValue,
          playerTurn: playerTurn),
    );
  }

  void _tapped(int index) {
    setState(
      () {
        if (turn && dispalyValue[index] == '') {
          dispalyValue[index] = 'o';
          filledBoxes += 1;
          whooseTurn = false;
        } else {
          dispalyValue[index] = 'x';
          filledBoxes += 1;
          whooseTurn = true;
        }
        turn = !turn;
        if (dispalyValue[0] == dispalyValue[1] &&
            dispalyValue[0] == dispalyValue[2] &&
            dispalyValue[0] != '') //1 row
        {
          isWinner = true;
          _showWinDialog(dispalyValue[0]);
        }
        if (dispalyValue[3] == dispalyValue[4] &&
            dispalyValue[3] == dispalyValue[5] &&
            dispalyValue[3] != '') //2 row
        {
          isWinner = true;
          _showWinDialog(dispalyValue[3]);
        }
        if (dispalyValue[6] == dispalyValue[7] &&
            dispalyValue[6] == dispalyValue[8] &&
            dispalyValue[6] != '') //3 row
        {
          isWinner = true;
          _showWinDialog(dispalyValue[6]);
        }
        if (dispalyValue[0] == dispalyValue[3] &&
            dispalyValue[0] == dispalyValue[6] &&
            dispalyValue[0] != '') //1 column
        {
          isWinner = true;
          _showWinDialog(dispalyValue[0]);
        }
        if (dispalyValue[1] == dispalyValue[4] &&
            dispalyValue[1] == dispalyValue[7] &&
            dispalyValue[1] != '') //2 column
        {
          isWinner = true;
          _showWinDialog(dispalyValue[1]);
        }
        if (dispalyValue[2] == dispalyValue[5] &&
            dispalyValue[2] == dispalyValue[8] &&
            dispalyValue[2] != '') //3 column
        {
          isWinner = true;
          _showWinDialog(dispalyValue[2]);
        }
        if (dispalyValue[0] == dispalyValue[4] &&
            dispalyValue[0] == dispalyValue[8] &&
            dispalyValue[0] != '') //1 diag
        {
          isWinner = true;
          _showWinDialog(dispalyValue[0]);
        }
        if (dispalyValue[2] == dispalyValue[4] &&
            dispalyValue[2] == dispalyValue[6] &&
            dispalyValue[2] != '') //2 diag
        {
          isWinner = true;
          _showWinDialog(dispalyValue[2]);
        } else if (filledBoxes == 9 && isWinner == false) {
          _showDrawDialog();
        }
        if (whooseTurn == true) {
          playerTurn = 'O';
        } else {
          playerTurn = 'X';
        }
      },
    );
  }

  void _clearBoard(dispalyValue) {
    setState(() {
      for (int i = 0; i < 9; i++) {
        dispalyValue[i] = '';
      }
      filledBoxes = 0;
      isWinner = false;
    });
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EndgameWidget(_clearBoard, 'Draw!', dispalyValue);
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EndgameWidget(_clearBoard, 'Winner is: $winner', dispalyValue);
      },
    );

    if (winner == 'o') {
      oScore += 1;
    } else {
      xScore += 1;
    }
  }
}
