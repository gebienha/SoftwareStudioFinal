import 'package:flutter/material.dart';

import '../../components/socal_card.dart';
import '../../constants.dart';
//import 'components/questions_form.dart';
import 'quiz_question.dart';
import 'questions_summary.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });
  
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void _answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      _currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = QuizQuestion.questions[_currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Muli'
              ),
            ),
            const SizedBox(height: 30),
            ...List.generate(currentQuestion.answers.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: AnswerButton(
                  answerText: currentQuestion.answers[index],
                  onTap: () {
                    final answerLetter = String.fromCharCode(65 + index); // Convert index to letter
                    _answerQuestion(answerLetter);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
