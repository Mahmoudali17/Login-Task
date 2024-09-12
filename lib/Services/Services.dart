import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

Future<void> registerUser(String email , String password) async {
  UserCredential user = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
      email: email, password: password
  );
}

Future<void> LoginUser(String email , String password) async {
  UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
}