import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: MusicNotesButton(color: Colors.red, musicNoteAssetFile: 'note1.wav')),
              Expanded(child: MusicNotesButton(color: Colors.orange, musicNoteAssetFile: 'note2.wav')),
              Expanded(child: MusicNotesButton(color: Colors.yellow, musicNoteAssetFile: 'note3.wav')),
              Expanded(child: MusicNotesButton(color: Colors.green, musicNoteAssetFile: 'note4.wav')),
              Expanded(child: MusicNotesButton(color: Colors.blue, musicNoteAssetFile: 'note5.wav')),
              Expanded(child: MusicNotesButton(color: Colors.indigo, musicNoteAssetFile: 'note6.wav')),
              Expanded(child: MusicNotesButton(color: Colors.purple, musicNoteAssetFile: 'note7.wav'))
            ],
          ),
        ),
      ),
    );
  }
}

class MusicNotesButton extends StatefulWidget {
  final MaterialColor color;
  final String musicNoteAssetFile;

  MusicNotesButton({this.color, this.musicNoteAssetFile});

  @override
  _MusicNotesButtonState createState() => _MusicNotesButtonState(
      color: color, musicNoteAssetFile: musicNoteAssetFile);
}

class _MusicNotesButtonState extends State<MusicNotesButton> {
  final MaterialColor color;
  final String musicNoteAssetFile;
  final player = AudioCache();

  _MusicNotesButtonState({this.color, this.musicNoteAssetFile});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: this.color,
      onPressed: () {
        player.play(this.musicNoteAssetFile);
      },
      child: null,
    );
  }
}
