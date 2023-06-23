import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/api/youtube_apis/video_notifier.dart';
import 'package:little_happyfish/api/youtube_apis/video_page.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../models/course.dart';
import 'course_description.dart';

class DetailPage extends StatefulWidget {
  final Course course;

  const DetailPage(this.course, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<VideoNotifier>(context, listen: false).fetchVideos();
  }

  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        CustomAppBar(widget.course),
        CourseDescription(widget.course),
        const VideoPage(),
      ],
    );
  }
}
