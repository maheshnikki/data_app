import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_app/Credentials-Page/login-page.dart';
import 'package:flutter/material.dart';


class NoConnection extends StatefulWidget {
  NoConnection({Key? key}) : super(key: key);

  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {

  late StreamSubscription sub;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);
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
    return Scaffold(
      body: isConnected 
      ? LoginPage()
        : Image.asset('assets/Gifs/no-data.jpg'),
    );
  }
}
