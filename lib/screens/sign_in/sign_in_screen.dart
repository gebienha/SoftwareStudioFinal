import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import Google Sign-In
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import '../home/home_screen.dart'; // Import the home screen after sign-in
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  Future<void> _googleSignIn(BuildContext context) async {
    try {
      print('Attempting to sign in with Google...');
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: '39536504302-as5ubn1qs8hl6re4qiehnl25mvrrmgqd.apps.googleusercontent.com', // Replace with your OAuth Client ID
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        print('User canceled the sign-in');
        return;
      }

      print('User signed in: ${googleUser.email}');
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in with Google, navigating to LoginSuccessScreen');
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    } catch (error) {
      print('Error during Google sign-in: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF60C6A2)),
        title: const Text("Sign In", style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Hi, glad to have you back!",
                    style: TextStyle(
                      color: Color(0xFF18181B),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let’s start another day",
                    style: TextStyle(
                      color: Color(0x9918181B),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SignForm(),
                  const SizedBox(height: 20),
                  const Text(
                    "or sign in with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x9918181B),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () => _googleSignIn(context), // Trigger Google Sign-In
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
