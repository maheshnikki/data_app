import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container( child: Text('Chart'),);
  }
}
