import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import 'questions_summary.dart';
import 'quiz_question.dart';
import '../login_success/login_success_screen.dart';
import 'package:provider/provider.dart';
//import 'components/questions_form.dart';

class QuizSummaryProvider with ChangeNotifier {
  List<Map<String, Object>> _summaryData = [];

  List<Map<String, Object>> get summaryData => _summaryData;

  void setSummaryData(List<Map<String, Object>> summary) {
    _summaryData = summary;
    notifyListeners();
  }
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required List<String> chosenAnswers,
    required void Function() onRestart,
  })  : _onRestart = onRestart,
        _chosenAnswers = chosenAnswers;

  final List<String> _chosenAnswers;
  final void Function() _onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < _chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': QuizQuestion.questions[i].text,
          'user_answer': _chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = QuizQuestion.questions.length;
    /*final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;*/
    final summary = summaryData;
    Provider.of<QuizSummaryProvider>(context, listen: false).setSummaryData(summary);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'We\'ve got your result! :D',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: _onRestart,
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                //icon: const Icon(Icons.arrow_forward_ios),
                label: const Text(
                  'Proceed to Chat', 
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
