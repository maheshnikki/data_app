import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleName = TextEditingController();

  void Add() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Welcome To The Data',
          textAlign: TextAlign.center,
          ),
          content: Text(
            'Hello, We are happy to see you here,',

            ),
        actions: <Widget>[
          Text('Thanks you'),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: submitTitle,
            child: InkWell(
              child: Text(
                'OK',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submitTitle() {
    Navigator.pop(context, 'OK');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Add,
        child: Icon(Icons.accessibility_outlined),
      ),
    );
  }
}
