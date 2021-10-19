import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_app/Credentials-Page/login-page.dart';
import 'package:data_app/Screen/No-connection/no-internet-image-page.dart';
import 'package:data_app/Screen/nav-Tab/Home.dart';
import 'package:data_app/Screen/nav-Tab/camera-page.dart';
import 'package:data_app/Screen/nav-Tab/chart.dart';
import 'package:data_app/Screen/nav-Tab/data.dart';
import 'package:data_app/Screen/nav-Tab/emoji.dart';
import 'package:data_app/Screen/nav-Tab/notes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void SettingPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(
              // name: emailController.text,
              )),
    );
  }

  late StreamSubscription sub;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          isConnected = true;
        } else {
          isConnected = false;
        }
      });
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isConnected
        ? DefaultTabController(
            length: 4,
            initialIndex: 1,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Data',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 17,
                  ),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.indigo.shade900,
                actions: <Widget>[
                  Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: SettingPage,
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                bottom: TabBar(
                  labelColor: Color(0xFFFFFFFF),
                  indicatorColor: Colors.white,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // isScrollable: true,

                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.photo_camera),
                    ),
                    Tab(
                      text: 'HOME',
                    ),
                    Tab(
                      text: 'Notes',
                    ),
                    Tab(
                      text: 'Chart',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Camera(),
                  Home(),
                  Notes(),
                  Chart(),
                ],
              ),
            ),
          )
        : NoInternetImagePage();
  }
}
