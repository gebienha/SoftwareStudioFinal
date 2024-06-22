import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'questions_screen.dart';
import 'quiz_question.dart';
import 'results_screen.dart';
import '../AIChat/AIChatScreen.dart';
import '../../../constants.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveBendera(int value) async {
    await _db.collection('bendera').doc('currentBendera').set({'value': value});
  }

  Future<int> fetchBendera() async {
    DocumentSnapshot doc = await _db.collection('bendera').doc('currentBendera').get();
    return doc.exists ? doc['value'] as int : 0;
  }
}


class BenderaProvider with ChangeNotifier {
  int _bendera = 0;
  final FirestoreService _firestoreService = FirestoreService(); // Initialize the Firestore service
  
  BenderaProvider() {
    fetchBendera();
  }

  int get bendera => _bendera;

  set bendera(int value) {
    _bendera = value;
    notifyListeners();
    _firestoreService.saveBendera(value); // Save the value to Firestore
  }

  Future<void> fetchBendera() async {
    _bendera = await _firestoreService.fetchBendera();
    notifyListeners();
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  static String routeName = "/quiz";
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = 'questions-screen';  // Start directly at the questions screen

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == QuizQuestion.questions.length) {
      setState(() {
        _activeScreen = 'results-screen';  // Go to results screen after last question
      });
    } else {
      setState(() {});  // Update state to stay on current screen with new data
    }
  }

  void _restartQuiz() {
    Navigator.pushNamed(context, AIChatScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (_activeScreen) {
      case 'questions-screen':
        screenWidget = QuestionsScreen(
          onSelectAnswer: _chooseAnswer,
        );
        break;
      case 'results-screen':
        screenWidget = ResultsScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: _restartQuiz,
        );
        break;
      default:
        screenWidget = QuestionsScreen(  // Default to questions screen if uncertain
          onSelectAnswer: _chooseAnswer,
        );
        break;
    }

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: 
            LinearGradient(
              colors: [

                Color.fromARGB(255, 197, 237, 224),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
