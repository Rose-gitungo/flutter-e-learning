import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/api/youtube_apis/video_play.dart';
import 'package:little_happyfish/models/video.dart';

class VideoListTile extends StatelessWidget {
  final Video video;

  const VideoListTile(this.video, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(
          builder:(context)=> VideoPlay(video: video,)));

      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Image.network(video.thumbnail!),
            Text(
              video.title ?? 'No Title',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
