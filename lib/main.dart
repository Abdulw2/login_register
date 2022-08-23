import 'package:flutter/material.dart';
import 'package:login_register/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register and Log in',
      theme: ThemeData(
       
        primarySwatch: Colors.deepOrange,
      ),
      home: const LoginScreen(),
      // we are usin the material route, not the initial route.
    );
  }
}
