import 'package:flutter/material.dart';

class ScoresPage extends StatelessWidget {
  final List<int> scores;

  const ScoresPage({
    Key? key,
    required this.scores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (BuildContext context, int index) {
          final score = scores[index];
          return ListTile(
            title: Text('Score ${index + 1}: $score'),
          );
        },
      ),
    );
  }
}
