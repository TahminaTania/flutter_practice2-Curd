import 'package:flutter/material.dart';

class SingledataScreen extends StatelessWidget {
  const SingledataScreen({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Text("${data}"),
    ));
  }
}
