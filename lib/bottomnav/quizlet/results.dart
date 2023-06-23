import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int resultScore;
  final Function()? resetHandler;
  final Function(BuildContext context, int score)? onNavigateToScores;

  const Result(
    this.resultScore,
    this.resetHandler, {
    Key? key,
    this.onNavigateToScores,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

// Define the scores method

class _ResultState extends State<Result> {
  // ... //Remark Logic
  String get resultPhrase {
    String resultText;
    if (widget.resultScore >= 41) {
      resultText = 'You are awesome!';
      print(widget.resultScore);
    } else if (widget.resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(widget.resultScore);
    } else if (widget.resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (widget.resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(widget.resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '${widget.resultScore}',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: widget.resetHandler,
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (widget.onNavigateToScores != null) {
                widget.onNavigateToScores!(context, widget.resultScore);
              }
            },
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'View Scores',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
