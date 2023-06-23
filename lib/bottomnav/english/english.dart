import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EnglishQuiz extends StatefulWidget {
  @override
  State<EnglishQuiz> createState() => _EnglishQuizState();
}

class _EnglishQuizState extends State<EnglishQuiz> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is a synonym for "happy"?',
      'options': ['sad', 'glad', 'mad', 'bad'],
      'answer': 'glad',
    },
    {
      'question': 'What is the past tense of the verb "eat"?',
      'options': ['eated', 'eaten', 'ate', 'eat'],
      'answerIndex': 1,
    },
    {
      'question': 'What is the plural of "child"?',
      'options': ['childs', 'childes', 'children', 'childern'],
      'answerIndex': 2,
    },
  ];

  var _currentQuestionIndex = 0;
  var _score = 0;

  void _checkAnswer(int answerIndex) {
    if (answerIndex == _questions[_currentQuestionIndex]['answerIndex']) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Complete'),
          content: Text('You scored $_score out of ${_questions.length}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                });
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final question = _questions[_currentQuestionIndex]['question'];
    //final options = _questions[_currentQuestionIndex]['options'];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //  const SizedBox(height: 24.0),
            _questions[_currentQuestionIndex]['options'].map((option) {
              return ElevatedButton(
                onPressed: () => _checkAnswer(_currentQuestionIndex),
                child: Text(option),
              );
            }),
          ],
        ),
      ),
    );
  }
}
