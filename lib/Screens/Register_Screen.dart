import 'dart:developer';

import 'package:task1/Screens/Login_Screen.dart';
import 'package:task1/Widgets/Custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Services/Services.dart';
import '../Widgets/Custom_Text_Field.dart';
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static String id = 'Register page';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
   GlobalKey<FormState> formKey = GlobalKey();
   String? email , password;

  @override
  Widget build(BuildContext context) {
    return
      ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Color(0xff2B475E),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login Task',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  CustomFormTextField(
                    onChanged: (emailData){
                      email = emailData;
                    },
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    onChanged: (passwordData){
                      password = passwordData;
                    },
                    hintText: "Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButon(
                    onTap: ()async{
                      if(formKey.currentState!.validate()) {
                        setState(() {
                          isLoading= true;
                        });
                        try {
                          await registerUser(email!,password!);
                          showSnackBar(context,
                              "Successfully saved.” “Your account details have been saved.");
                          Navigator.pushNamed(context, "HomeScreen");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "email-already-in-use") {
                            showSnackBar(context, "Email already in use");
                          }
                        } catch (ex) {
                          showSnackBar(context, ex.toString());
                        }
                        setState(() {
                          isLoading= false;
                        });
                      }
                    },
                      text: "Register"
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\'t have an account?  ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        child: Text("Login",style: TextStyle(color: Colors.white,),),
                        onTap: (){Navigator.pop(context);} ,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}