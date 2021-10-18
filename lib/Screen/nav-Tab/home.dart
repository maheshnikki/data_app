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
        title: Text('Add the title'),
        actions: <Widget>[
          TextField(
            controller: titleName,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.task_square),
              labelStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
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
    print(titleName.text);
    titleName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Add,
        child: Icon(Iconsax.add5),
      ),
    );
  }
}
