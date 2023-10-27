class Questions {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Flutter?',
      'choices': ['A programming language', 'A UI framework', 'A database', 'A game engine'],
      'correctAnswer': 'A UI framework',
    },
    {
      'question': 'Which programming language is Flutter based on?',
      'choices': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'correctAnswer': 'Dart',
    },
    {
      'question': 'What is the main benefit of using Flutter?',
      'choices': ['Fast performance', 'Native code', 'Cross-platform development', 'Strongly typed language'],
      'correctAnswer': 'Cross-platform development',
    },
    {
      'question': 'What is a widget in Flutter?',
      'choices': ['A graphical element', 'A database table', 'A network request', 'A folder structure'],
      'correctAnswer': 'A graphical element',
    },
    {
      'question': 'How do you add interactivity in Flutter?',
      'choices': ['By yelling at the screen', 'Using callbacks', 'Using CSS', 'Writing HTML'],
      'correctAnswer': 'Using callbacks',
    },
  ];

  Map<String, dynamic>? getQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      return _questions[index];
    }
    return null;
  }

  int getQuestionCount() {
    return _questions.length;
  }

  String? getCorrectAnswer(int questionIndex) {
    if (questionIndex >= 0 && questionIndex < _questions.length) {
      return _questions[questionIndex]['correctAnswer'];
    }
    return null;
  }
}
