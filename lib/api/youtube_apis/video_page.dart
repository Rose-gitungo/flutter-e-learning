import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:little_happyfish/api/youtube_apis/video_list_tile.dart';
import 'package:little_happyfish/api/youtube_apis/video_notifier.dart';
import 'package:little_happyfish/models/video.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<VideoNotifier, List<Video>>(
        selector: (
          _,
          notifier,
        ) =>
            notifier.videoList,
        builder: (_, videoList, __) {
          return Expanded(
            child: Container(
              color: Colors.black87,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: videoList.length,
                  itemBuilder: (_, index) => VideoListTile(videoList[index]),
                ),
              ),
            ),
          );
        });
  }
}
