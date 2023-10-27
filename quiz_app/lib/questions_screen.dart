import 'package:flutter/material.dart';
import 'score_screen.dart';
import 'question_generate.dart';

class QuestionsScreen extends StatefulWidget {
  final String pname;
  QuestionsScreen({required this.pname});

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
    Future.delayed(Duration(milliseconds: 20), () {
      if (_timerValue > 0.0) {
        setState(() {
          _timerValue -= 0.01 / 10;
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

  void _nextQuestion(String pname) {
    if (_questionIndex < _questions.getQuestionCount() - 1) {
      setState(() {
        _questionIndex++;
        _timerValue = 1.0;
        startTimer();
        _answered = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScoreScreen(
                  score: _correctAnswers,
                  name: pname,
                )),
      );
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
            children: [
              Container(
                width: 350.0,
                height: 30,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: _timerValue,
                    backgroundColor: Colors.transparent,
                    color: Color(0xFF3F5EFB),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350.0,
                height: 500,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        question?['question'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ..._buildOptions(question?['choices']),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed:
                          _answered ? () => _nextQuestion(widget.pname) : null,
                      child: Text('Next Question'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3F5EFB),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(330, 60),
                      ),
                    )
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
              width: 350.0,
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _answered
                    ? (isCorrect
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7))
                    : Color.fromRGBO(255, 255, 255, 0.2),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${i + 1}. ${choices[i]}',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
    }
    return optionWidgets;
  }
}
