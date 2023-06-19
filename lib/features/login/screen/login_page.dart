import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/features/sign_up/widgets/reuseable_button.dart';
import 'package:flutter_p2/screen/home_screen.dart';
import 'package:flutter_p2/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Log In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            reuseableButton(context, false, () async {
              // final name = _emailController.text;
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.setBool(SplashScreenState.KeyLogin, true);

              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passController.text)
                  .then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            }),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
