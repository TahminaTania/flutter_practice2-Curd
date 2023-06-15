import 'package:flutter/material.dart';

class SingledataScreen extends StatelessWidget {
  const SingledataScreen({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: MaterialButton(
          onPressed: () {},
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListTile(
        leading: Text('${data.id}'),
        title: Text(data.title),
        subtitle: Text(data.body),
      ),
    ));
  }
}
