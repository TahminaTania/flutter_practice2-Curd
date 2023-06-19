import 'package:flutter/material.dart';
import 'package:flutter_p2/features/showdata/DialougeBox/dialoges.dart';
import 'package:flutter_p2/features/showdata/cubit/fetchdata_cubit.dart';
import 'package:flutter_p2/features/sign_up/widgets/reuseable_button.dart';
import 'package:flutter_p2/features/sign_up/widgets/reuseable_textfield.dart';
import 'package:flutter_p2/screen/home_screen.dart';
import 'package:flutter_p2/screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width < 800
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffCB2B93),
            Color(0xff9546C4),
            Color(0xff5E61F4),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  reuseableTextField(
                      "Enter UserName", Icons.person, false, _nameController),
                  SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter EmailId", Icons.verified_user,
                      false, _emailController),
                  SizedBox(
                    height: 20,
                  ),
                  reuseableTextField("Enter Password", Icons.lock_outline, true,
                      _passController),
                  SizedBox(
                    height: 20,
                  ),
                  reuseableButton(context, true, () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passController.text)
                          .then((value) => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()))
                              });
                    } on FirebaseAuthException catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                              e.code,
                              style: TextStyle(color: Colors.red),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    //     .onError((error, stackTrace) {
                    //   print("error on ${error.toString()}");
                    // });
                  }),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("already have an account?? the Log In"),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
