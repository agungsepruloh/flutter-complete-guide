import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    // using map class for questions and answers
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 7},
        {'text': 'White', 'score': 8},
        {'text': 'Green', 'score': 9},
        {'text': 'Blue', 'score': 10}
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Snake', 'score': 9},
        {'text': 'Lion', 'score': 9},
        {'text': 'Turtle', 'score': 10}
      ],
    },
    {
      'questionText': 'What is your favorite drink?',
      'answers': [
        {'text': 'Milk', 'score': 10},
        {'text': 'Coffee', 'score': 8},
        {'text': 'Chocolate', 'score': 9},
        {'text': 'Honey', 'score': 10}
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('This is My Fisrt App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
