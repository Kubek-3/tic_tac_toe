import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/basic_widget.dart';
import 'package:tic_tac_toe/widgets/infobox_widget.dart';
import 'package:tic_tac_toe/styles/board_text_style.dart';

// ignore: must_be_immutable
class MainColumn extends StatelessWidget {
  MainColumn({
    required this.oScore,
    required this.xScore,
    required this.onTapped,
    required this.dispalyValue,
    required this.playerTurn,
    super.key,
  });

  List<String> dispalyValue;
  int oScore;
  int xScore;
  String playerTurn;
  final Function(int) onTapped;
  @override
  Widget build(context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 80),
                  BasicWidget(
                    'Player O: $oScore',
                    const Color.fromRGBO(200, 230, 201, 1),
                  ),
                  BasicWidget(
                    'Player X: $xScore',
                    const Color.fromRGBO(255, 205, 210, 1),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoboxWidget(
                    'Player O starts first game. Loser always starts next round.',
                    Color.fromRGBO(207, 216, 220, 1),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    onTapped(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue[200]),
                      child: Center(
                        child: Text(
                          dispalyValue[index],
                          style: boardTextStyle,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        BasicWidget(
          'Player turn: $playerTurn',
          const Color.fromRGBO(207, 216, 220, 1),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
