import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import '../sign_in/sign_in_screen.dart';

class SignInOrSignUp extends StatefulWidget {
  const SignInOrSignUp({super.key});

  @override
  State<SignInOrSignUp> createState() => _SignInOrSignUpState();
}

class _SignInOrSignUpState extends State<SignInOrSignUp> {

  bool showSignInPage = true;

  void togglePage() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInScreen();
      
    }
    else{
      return SignUpScreen();
    }
  }
}
