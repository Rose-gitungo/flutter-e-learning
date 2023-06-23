import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../components/active_course.dart';
import '../components/feature_course.dart';

//home butoon on bottom navigation screen

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          FeatureCourse(),
          const ActiveCourse(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
