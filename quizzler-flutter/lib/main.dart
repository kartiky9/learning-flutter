import 'package:flutter/material.dart';
import 'quiz_brain.dart';

import 'game_over_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  void updateScores(bool userAnswer) {
    if (quizBrain.checkAnswer(userAnswer)) {
      scoreKeeper.add(Flexible(
          child: ScoreIcon(
        type: ScoreIcons.correct,
      )));
    } else {
      scoreKeeper.add(Flexible(
          child: ScoreIcon(
        type: ScoreIcons.wrong,
      )));
    }
  }

  Future<void> showGameOverAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return GameOverAlert(
          title: 'Game Over',
          backgroundColor: Colors.grey,
          buttonText: 'Restart',
          content: 'Restart Game?',
          onPressed: () {
            Navigator.of(context).pop();
            restartGame();
          },
        );
      },
    );
  }

  void restartGame() {
    setState(() {
      quizBrain = QuizBrain();
      scoreKeeper.clear();
    }); 
  }

  @override
  Widget build(BuildContext context) {
    String currentQuestion = quizBrain.getNextQuestion();

    if(currentQuestion.isEmpty) setState(() {
      showGameOverAlert();
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQuestion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  updateScores(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  updateScores(false);
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: scoreKeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

enum ScoreIcons { correct, wrong }

class ScoreIcon extends StatelessWidget {
  final ScoreIcons type;

  const ScoreIcon({this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ScoreIcons.correct:
        return Icon(
          Icons.check,
          color: Colors.green,
        );
        break;
      case ScoreIcons.wrong:
        return Icon(
          Icons.close,
          color: Colors.red,
        );
        break;
    }
  }
}
