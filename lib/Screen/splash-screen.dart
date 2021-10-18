import 'dart:async';

import 'package:data_app/Credentials-Page/login-page.dart';
import 'package:data_app/hex-color/Hex_color.dart';
import 'package:data_app/no-connection.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
  }
  HexColor _color = HexColor('#03045e');
  HexColor _color1 = HexColor('#ff0a54');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
              child: Image.asset('assets/Gifs/output-onlinegiftools.gif'),
        ),
        CircularProgressIndicator(),
            ],
            
          ),

        ],
      ),
      
    );
  }
}
