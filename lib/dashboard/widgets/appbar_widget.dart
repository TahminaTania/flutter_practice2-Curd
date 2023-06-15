import 'package:flutter/material.dart';
import 'package:flutter_p2/features/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/splash_screen.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
  }) : super(key: key);
  //final String user; required this.user

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Container(child: Text("Hello ${user}")),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool(SplashScreenState.KeyLogin, false);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            },
            child: Text("Log Out"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Background color
            ),
          )),
        ],
      ),
    );
  }
}
