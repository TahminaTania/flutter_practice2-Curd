import 'package:flutter/material.dart';
import 'package:flutter_p2/dashboard/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              controller: _userNameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final name = _userNameController.text;
                //final password = _passwordController.text;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool(SplashScreenState.KeyLogin, true);
                Navigator.of(context, rootNavigator: true)
                    .pushNamed("/home", arguments: name);
                // Navigator.pushNamed(
                //   context,
                //   '/home',
                //   arguments: {'user': name},
                // );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
