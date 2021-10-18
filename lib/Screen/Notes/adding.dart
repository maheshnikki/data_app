import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Adding extends StatefulWidget {
  final Function addinpage;
  Adding(this.addinpage);
  // Adding({Key? key}) : super(key: key);

  @override
  _AddingState createState() => _AddingState();
}

class _AddingState extends State<Adding> {
  final titleName = TextEditingController();
  final UserNote = TextEditingController();

  void submitDisplay() {
    final enteredTitleName = titleName.text;
    final enteredUserNotes = UserNote.text;
    bool _validate = false;

    if (enteredTitleName == '' || enteredUserNotes == '') {
      // setState(() {
      //   enteredTitleName=='' || enteredUserNotes==''
      // ? _validate = true
      // : _validate = false;
      // });
      submitDisplay();
    } else {
      print('okay');
    }

    print(enteredTitleName);
    print(enteredUserNotes);

    widget.addinpage(
      enteredTitleName,
      enteredUserNotes,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add the Notes',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextField(
          controller: titleName,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.title_rounded),
            labelText: 'Title Name',
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: UserNote,
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.task_square),
            labelText: 'Enter Notes',
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          maxLines: null,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: InkWell(
                child: Text(
                  'Close',
                ),
              ),
            ),
            TextButton(
              onPressed: submitDisplay,
              child: InkWell(
                child: Text(
                  'OK',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
