import 'package:flutter/material.dart';

class NoInternetImagePage extends StatefulWidget {
  NoInternetImagePage({Key? key}) : super(key: key);

  @override
  _NoInternetImagePageState createState() => _NoInternetImagePageState();
}

class _NoInternetImagePageState extends State<NoInternetImagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
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
          );
  }
}
