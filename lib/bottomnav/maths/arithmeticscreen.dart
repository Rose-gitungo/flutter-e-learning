import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

class ArithmeticScreen extends StatefulWidget {
  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  int firstNumber = math.Random().nextInt(10);
  int secondNumber = math.Random().nextInt(10);
  int result = 0;

  void calculateResult() {
    setState(() {
      result = firstNumber + secondNumber;
    });
  }

  void generateNumbers() {
    setState(() {
      firstNumber = math.Random().nextInt(10);
      secondNumber = math.Random().nextInt(10);
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'What is $firstNumber + $secondNumber?',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (int.tryParse(value) != null) {
                  setState(() {
                    result = int.parse(value);
                  });
                }
              },
              decoration: const InputDecoration(
                hintText: 'Enter your answer here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: result == firstNumber + secondNumber
                  ? generateNumbers
                  : calculateResult,
              child: result == firstNumber + secondNumber
                  ? const Text('Next Question')
                  : const Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
