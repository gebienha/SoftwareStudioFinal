class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      'Which most closely describes the look of your pores?',
      [
        'Large and visible all over',
        'Medium-sized all over',
        'Small, not easily noticed all over',
        'Larger or medium and only visible in the T-Zone',
      ],
    ),
    QuizQuestion('When does your skin look red?', [
      'Whenever and wherever I use new products',
      'Sometimes but only around my cheeks',
      'Any time I have blemishes',
      'More often than I care to admit',
    ]),
    QuizQuestion(
      'I would describe the shine of my skin like this:',
      [
        'Shiny in my T-Zone, but dull on my cheeks',
        'Bright like a diamond',
        'Dull everywhere',
        'I get more stinging than shine',
      ],
    ),
    QuizQuestion(
      'How does it feel when you touch your skin?',
      [
        'Rough and scaly',
        'Oily in places and dry in others',
        'Irritated and angry',
        'Slick and greasy',
      ],
    ),
    QuizQuestion(
      'In the afternoon, my skin needs:',
      [
        'Blotting or powder all over',
        'A refreshing spritz of facial spray',
        'Blotting or powdering on the forehead, nose, and/or chin',
        'Moisturixing, moisturizing, moisturizing',
      ],
    ),
    QuizQuestion(
      'How does your skin feel after you wash your face?',
      [
        'Itchy and a little bit dry',
        'Clean, for now, but the oil is coming soon',
        'Stripped of moisture',
        'Clean and great in my T-zone, but my cheeks are a little bit dried out',
      ],
    ),
    QuizQuestion(
      'Pick the one that best describes your skin\'s relationship with pimples and blackheads.',
      [
        'I hate them, but they love me',
        'They have their territory arounf my T-zone, and I have claimed the cheeks for my own',
        'I\'d trade my skin\'s flakiness and tightness for a few blackheads',
        'My blemishes are more likely to be broken capillaries or rashes',
      ],
    ),
  ];
}
