import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/components/categorytitle.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'
    show CircularPercentIndicator;

class ActiveCourse extends StatelessWidget {
  const ActiveCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const CategoryTitle(
            leftText: 'Currently Active', rightText: 'View All'),
        Container(
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      //an image
                      child: Image.asset('lib/images4p/maths.png', width: 60)),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Symetry Data',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2 lessons left',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: 0.61,
                center: const Text(
                  '61%',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
