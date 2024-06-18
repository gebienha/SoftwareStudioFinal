class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      'How does it feel after washing your face?',
      [
        'A. It feels dry',
        'B. It feels fine',
      ],
    ),
    QuizQuestion('Is your T-Zone oily?', [
      'A. Yes',
      'B. No',
    ]),
    QuizQuestion(
      'I have big pores',
      [
        'A. Yep, thats me',
        'B. No, i have small pores',
      ],
    ),
    QuizQuestion(
      'How would you describe your face\'s skin',
      [
        'A. Rough and scaly',
        'B. Smooth',
      ],
    ),
  ];
}
