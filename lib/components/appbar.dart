import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/course.dart';

class CustomAppBar extends StatelessWidget {
  final Course course;
  CustomAppBar(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(course.imgurl, fit: BoxFit.cover),
                ),
              ),
              Container(
                height: 20,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 40,
            child: Container(
              //size of elevated button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text('Start Class'),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ))
        ],
      ),
    );
  }
}
