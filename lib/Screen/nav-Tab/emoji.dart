import 'package:flutter/material.dart';

class Emoji extends StatefulWidget {
  Emoji({Key? key}) : super(key: key);

  @override
  _EmojiState createState() => _EmojiState();
}

class _EmojiState extends State<Emoji> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('emoji'),);
  }
}
