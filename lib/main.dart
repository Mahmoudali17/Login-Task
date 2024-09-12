import 'package:task1/Screens/Home_Screen.dart';
import 'package:task1/Screens/Register_Screen.dart';
import 'package:task1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Login_Screen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform ,
  );
  runApp( MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RegisterScreen.id : (context) => RegisterScreen(),
        "HomeScreen" : (context) => HomeScreen(),
      },
      home: LoginScreen(),
    );
  }
}