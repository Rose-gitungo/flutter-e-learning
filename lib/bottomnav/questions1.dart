import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/bottomnav/questions1.dart';
import 'package:little_happyfish/bottomnav/quizlet/quiz.dart';
import 'package:little_happyfish/bottomnav/quizlet/results.dart';

class Questions1 extends StatefulWidget {
  const Questions1({super.key});

  // const Questions1({super.key});

  @override
  State<Questions1> createState() => _Questions1State();
}

class _Questions1State extends State<Questions1> {
  final _questions = const [
    {
      'questionText': 'Q1. What is the color of an apple?',
      'answers': [
        {'text': 'Green', 'score': -2},
        {'text': 'Yellow', 'score': -2},
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which animal says "Moo"?',
      'answers': [
        {'text': 'Cat', 'score': -2},
        {'text': 'Dog', 'score': -2},
        {'text': 'Cow', 'score': 10},
        {'text': 'Bird', 'score': -2},
      ],
    },
    {
      'questionText': 'Q3. What is the opposite of hot?',
      'answers': [
        {'text': 'Warm', 'score': -2},
        {'text': 'Cold', 'score': 10},
        {'text': 'Wet', 'score': -2},
        {'text': 'Dry', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Which month comes after March?',
      'answers': [
        {'text': 'April', 'score': 10},
        {'text': 'May', 'score': -2},
        {'text': 'June', 'score': -2},
        {'text': 'July', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Which shape has three sides?',
      'answers': [
        {'text': 'Square', 'score': -2},
        {'text': 'Rectangle', 'score': -2},
        {'text': 'Triangle', 'score': 10},
        {'text': 'Circle', 'score': -2},
      ],
    },
  ];

//initializing variables
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

//adds score and changes question index
  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
