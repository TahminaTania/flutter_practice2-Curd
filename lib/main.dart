import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_p2/dashboard/screen/home_screen.dart';
import 'package:flutter_p2/dashboard/screen/singledata_screen.dart';
import 'package:flutter_p2/features/login/screen/login_page.dart';
import 'package:flutter_p2/features/showdata/cubit/fetchdata_cubit.dart';
import 'package:flutter_p2/features/showdata/repo/repository.dart';
import 'package:flutter_p2/features/showdata/screens/data_page.dart';

import 'dashboard/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchdataCubit(UserRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        routes: {
          '/login': (context) => LogInScreen(),
          '/home': (context) => HomeScreen(),
          '/data': (context) => DataPage(),
        },
      ),
    );
  }
}
