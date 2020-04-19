import 'package:flutter/material.dart';

class GameOverAlert extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String content;
  final Color backgroundColor;
  final String buttonText;
  final Function onPressed;

  GameOverAlert({this.title, this.content,  this.backgroundColor, this.buttonText, this.onPressed, this.context});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      backgroundColor: Colors.grey.shade600,
      actions: <Widget>[FlatButton(child: Text(buttonText), onPressed: onPressed,)],
    );
  }
}