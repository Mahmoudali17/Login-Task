import 'package:task1/Screens/Register_Screen.dart';
import 'package:task1/Widgets/Custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Services/Services.dart';
import '../Widgets/Custom_Text_Field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  static String id = 'login page';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

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
                        'LOGIN',
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
                    obscureText: true,
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
                            await LoginUser(email!,password!);
                            showSnackBar(context,
                                "Login saved.” “Your account details have been verified.");
                            Navigator.pushNamed(context,"HomeScreen",arguments: email);
                          } on FirebaseAuthException catch (ee) {
                            if(ee.code == 'user-not-found') {
                              showSnackBar(context, "User not found , please Register");
                            }
                          } catch (ex) {
                            showSnackBar(context, ex.toString());
                          }
                          setState(() {
                            isLoading= false;
                          });
                        }
                      },
                      text: "Login"
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
                          child: Text("Register",style: TextStyle(color: Colors.white,),),
                          onTap: (){Navigator.pushNamed(context, RegisterScreen.id);} ,
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