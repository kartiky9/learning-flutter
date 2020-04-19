import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceButton = 2;

  int rightDiceButton = 5;

  void rollDice() {
    setState(() {
      leftDiceButton = Random().nextInt(6) + 1;
      rightDiceButton = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceButton.png'),
              onPressed: () {
                rollDice();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceButton.png'),
              onPressed: () {
                rollDice();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class DicePage extends StatelessWidget {

//   int leftDiceButton = 2;
//   int rightDiceButton = 5;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: FlatButton(
//               child: Image.asset('images/dice$leftDiceButton.png'),
//               onPressed: () {},
//             ),
//           ),
//           Expanded(
//             child: FlatButton(
//               child: Image.asset('images/dice$rightDiceButton.png'),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
