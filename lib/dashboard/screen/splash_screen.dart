import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KeyLogin = 'login';
  @override
  void initState() {
    super.initState();
    GoToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text("Welcome...."),
          ],
        )),
      ),
    );
  }

  void GoToNextScreen() async {
    SharedPreferences isLoggedIn = await SharedPreferences.getInstance();
    var loggedUser = isLoggedIn.getBool(KeyLogin);
    Timer(
      Duration(seconds: 2),
      () {
        if (loggedUser != null) {
          if (loggedUser) {
            Navigator.pushNamed(context as BuildContext, '/home');
          } else {
            Navigator.pushNamed(context as BuildContext, '/login');
          }
        } else {
          Navigator.pushNamed(context as BuildContext, '/login');
        }
      },
    );
  }
}
