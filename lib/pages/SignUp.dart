import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:little_happyfish/components/MyTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:little_happyfish/pages/HomeScreen.dart';
import '../components/MyButton.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  //controllers for text input
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  //create  user
  createUser() async {
    try {
      if (confirmpasswordController.text == passwordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error
        passwordsdontmatch();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-exists') {
        emailalreadyexists();
      } else if (e.code == 'invalid-email') {
        emailinvalid();
      } else if (e.code == 'invalid-password') {
        passwordsdontmatch();
      }
    }
  }

  emailinvalid() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email format is invalid'),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  void passwordsdontmatch() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  void emailalreadyexists() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email is already  registered'),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  passwordsixchar() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Password should be six characters'),
          backgroundColor: Colors.red,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'lib/images4p/translogo.png',
            height: 150,
          ),
          //textview of
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'REGISTER',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),

          //username
          const SizedBox(height: 10),
          MyTextField(
            controller: usernameController,
            hintText: 'Username',
            obscureText: false,
          ),

          //email textfield
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

          //confirm password
          const SizedBox(height: 10),
          MyTextField(
            controller: confirmpasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),

          const SizedBox(height: 10),
          MyButton(
            onTap: createUser,
          ),

          //already have an account text field
          //make it clickable
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
          // GestureDetector(
          //   onTap: widget.onTap,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 25),
          //     child: RichText(
          //       text: const TextSpan(
          //         children: [
          //           TextSpan(
          //             text: 'Already have an account?',
          //             style: const TextStyle(color: Colors.black87),
          //           ),
          //           TextSpan(
          //             text: 'Login',
          //             style: TextStyle(color: Colors.blue),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
