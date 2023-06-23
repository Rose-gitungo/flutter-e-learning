import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_happyfish/pages/HomeScreen.dart';
import 'package:little_happyfish/pages/LoginPage.dart';
import 'package:little_happyfish/pages/Login_Or_Register_Page.dart';

class auth_page extends StatelessWidget {
  const auth_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user logged in
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        //user not logged in
        else {
          return const LoginOrRegisterPage();
        }
      },
    ));
  }
}
