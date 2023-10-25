import 'package:flutter/material.dart';
import 'score_screen.dart';
import 'question_generate.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _questionIndex = 0;
  int _correctAnswers = 0;
  double _timerValue = 1.0;
  bool _answered = false;

  Questions _questions = Questions();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(milliseconds: 10), () {
      if (_timerValue > 0.0) {
        setState(() {
          _timerValue -= 0.001 / 150;
        });
        startTimer();
      } else {
        if (!_answered) {
          _handleAnswer(false);
        }
      }
    });
  }

  void _handleAnswer(bool isCorrect) {
    if (isCorrect) {
      _correctAnswers++;
    }
    setState(() {
      _answered = true;
    });
  }

  void _nextQuestion() {
    if (_questionIndex < _questions.getQuestionCount() - 1) {
      setState(() {
        _questionIndex++;
        _timerValue = 1.0;
        _answered = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? question = _questions.getQuestion(_questionIndex);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFC466B), Color(0xFF3F5EFB)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: LinearProgressIndicator(
                  value: _timerValue,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFC466B), Color(0xFF3F5EFB)],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        question?['question'],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ..._buildOptions(question?['choices']),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _answered ? _nextQuestion : null,
                      child: Text('Next Question'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions(List<String> choices) {
    List<Widget> optionWidgets = [];
    for (int i = 0; i < choices.length; i++) {
      final bool isCorrect =
          (choices[i] == _questions.getCorrectAnswer(_questionIndex));
      optionWidgets.add(
        GestureDetector(
          onTap: () {
            if (!_answered) {
              _handleAnswer(isCorrect);
            }
          },
          child: Container(
            width: 400,
            height: 50,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: _answered
                  ? (isCorrect ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5))
                  : Colors.white,
            ),
            child: Center(
              child: Text(
                '${i + 1}. ${choices[i]}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      );
    }
    return optionWidgets;
  }
}
