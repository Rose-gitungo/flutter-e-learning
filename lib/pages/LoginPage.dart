import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_happyfish/pages/HomeScreen.dart';
import 'package:little_happyfish/pages/SignUp.dart';
import 'package:little_happyfish/pages/forgotpassword.dart';
import '../components/MyButton.dart';
import '../components/MyTextField.dart';
import 'package:flutter/foundation.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongemailmessage();
      } else if (e.code == 'wrong-password') {
        wrongpasswordmessage();
      }
    }
  }

  void wrongemailmessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('User not found'),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  void wrongpasswordmessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 50),
            Image.asset(
              'lib/images4p/translogo.png',
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Login to account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),

            const SizedBox(height: 10),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            //textfields password
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 20),

            // forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),

            //button
            const SizedBox(height: 10),
            MyButton(
              onTap: signUserIn,
            ),

            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not a Member',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget buildsignuparea() {
    return GestureDetector(
      //  onTap: onTap,
      child: RichText(
          text: const TextSpan(
        children: [
          TextSpan(
              text: 'Don\'t have an Account?',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Sign up',
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold))
        ],
      )),
    );
  }
}
