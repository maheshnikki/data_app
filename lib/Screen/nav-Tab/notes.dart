import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:data_app/Screen/Notes/adding.dart';
import 'package:data_app/models/note-page-desc.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class Notes extends StatefulWidget {
  Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final titleName = TextEditingController();
  final UserNote = TextEditingController();

  void AddingNotes() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Adding(add),
    );
  }

  void add(String title, String Desc) {
    final addedTask = NotePageDesc(title, Desc);
    setState(() {
      NPD.add(addedTask);
    });
  }

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

    // widget.addNotes(
    //   enteredTitleName,
    //   enteredUserNotes,
    // );

    Navigator.of(context).pop();
  }

  // void OpenNotes() {

  // }

  Future refreshList() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      NPD.toList();
    });
  }

  final List<NotePageDesc> NPD = [NotePageDesc('title', 'Desc')];

  // final DateTime now = DateTime.now();
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // final String formatted = formatter.format(now);
  // print(formatted);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: SingleChildScrollView(
          child: NPD.isEmpty
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'No Notes',
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          'assets/Gifs/File searching.gif',
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: NPD.map((notes) {
                    return InkWell(
                      child: Card(
                        elevation: 5,
                        child: ExpansionTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg'),
                                radius: 20,
                              ),
                            ],
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2.8,
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      notes.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                child: Text(
                                  DateFormat('yyyy-MM-dd hh:mm')
                                      .format(DateTime.now()),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          20),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      notes.Desc,
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.delete,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      NPD.remove(notes);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onDoubleTap: () {
                      },
                    );
                  }).toList(),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Notes',
        onPressed: AddingNotes,
        child: Icon(Iconsax.add5),
      ),
    );
  }
}
