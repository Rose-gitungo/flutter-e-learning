import 'package:flutter/material.dart';

class forgotpassword extends StatelessWidget {
  forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          //textview of
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'forgot password page',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    ));
  }
}
