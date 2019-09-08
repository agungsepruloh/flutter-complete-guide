import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 10) {
      resultText = 'You are ... strange?!';
    } else if (resultScore <= 20) {
      resultText = 'You are pretty likeabble!';
    } else {
      resultText = 'You are great and innocent!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blueAccent,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
