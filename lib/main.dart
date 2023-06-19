import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_p2/features/sign_up/sign_up_page.dart';
import 'package:flutter_p2/screen/home_screen.dart';
import 'package:flutter_p2/features/login/screen/login_page.dart';
import 'package:flutter_p2/features/showdata/cubit/fetchdata_cubit.dart';
import 'package:flutter_p2/features/showdata/repo/repository.dart';
import 'package:flutter_p2/features/showdata/screens/data_page.dart';

import 'screen/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final DataRepository repository = DataRepository(http.Client());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchdataCubit(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignUpPage(),
        // home: StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (BuildContext context, snapshot) {
        //     return SignUpPage();
        //   },
        // ),
        routes: {
          '/login': (context) => LogInScreen(),
          '/home': (context) => HomeScreen(),
          '/data': (context) => DataPage(),
        },
      ),
    );
  }
}
