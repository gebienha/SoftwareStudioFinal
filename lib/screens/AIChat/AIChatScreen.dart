import 'package:flutter/material.dart';
import 'AIChat.dart';
import 'package:shop_app/screens/questions/quiz.dart';
import 'package:shop_app/screens/questions/results_screen.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../init_screen.dart';


class AIChatScreen extends StatelessWidget {
  static String routeName = "/AIChat";

  const AIChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        title: const Text('Chat', style: TextStyle(color: Color(0xFF60C6A2), fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              final benderaProvider = Provider.of<BenderaProvider>(context, listen: false);
              benderaProvider.bendera = 1; // This will automatically save to Firestore
              NavigationService().callUpdateIndex(0); // Call the global method to update index
              Navigator.pushNamed(context, InitScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: AIChat(),
    );
  }
}