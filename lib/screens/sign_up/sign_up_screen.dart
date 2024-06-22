import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../components/socal_card.dart'; // Ensure this import is correct
import '../../constants.dart';
import '../complete_profile/complete_profile_screen.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});

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
      print('Signed in with Google, navigating to CompleteProfileScreen');
      Navigator.pushNamed(context, CompleteProfileScreen.routeName);
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
        title: const Text("Sign Up", style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
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
                    "Register Account",
                    style: TextStyle(
                      color: Color(0xFF18181B),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x9918181B),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SignUpForm(),
                  const SizedBox(height: 20),
                  const Text(
                    "or sign up with",
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
                        press: () => _googleSignIn(context),
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
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Color(0x9918181B),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
