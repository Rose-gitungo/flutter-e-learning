import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/components/course_item.dart';

import '../models/course.dart';
import 'categorytitle.dart';

class FeatureCourse extends StatelessWidget {
  FeatureCourse({super.key});

  final coursesList = Course.generatecourse();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTitle(
          rightText: 'View All',
          leftText: 'Top of the Week',
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            scrollDirection: Axis.horizontal,
            itemCount: coursesList.length,
            itemBuilder: (context, index) => CourseItem(coursesList[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 15),
          ),
        ),
      ],
    );
  }
}
