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
    return Scaffold(
      body: isConnected ? LoginPage() : Column(
        children:<Widget> [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/Gifs/mirage-no-connection.png',
              fit: BoxFit.cover,
            ),
            ),
            Text(
            'Oops...',
            style: TextStyle(
              fontSize: 40,
              color: Colors.red.shade900,
            ),
            ),
          Text(
            'No Internet',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade900,
            ),
            ),
            Center(
              child: Text(
              'Please try again, make sure you have good Internet 🙂',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red.shade900,
              ),
              ),
            ),
        ],
      ),
    );
  }
}
