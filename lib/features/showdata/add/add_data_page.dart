import 'package:flutter/material.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: Text("Add Data"),
      )),
    );
    ;
  }
}
