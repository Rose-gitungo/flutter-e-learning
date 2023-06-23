import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/models/course.dart';
import 'package:little_happyfish/screens/details.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  CourseItem(this.course, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              //  child: ClipRRect(
              //     borderRadius: BorderRadius.circular(40),
              //     child: Image.asset(course.imgurl, fit: BoxFit.cover),
              //   ),
            ),
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        children: [
                          Text(
                            course.author,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(course.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(),
                            width: 5,
                            height: 5,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                          ),
                          const Text(
                            '2hr 22min',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      )
                    ]))
              ],
            ),
          ),
          Positioned(
              bottom: 60,
              right: 20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(course)));
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(color: Colors.black),
                  )))
        ],
      ),
    );
  }
}
