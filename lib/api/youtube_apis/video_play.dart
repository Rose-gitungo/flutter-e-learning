import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:little_happyfish/api/youtube_apis/video_play.dart';
import 'package:little_happyfish/api/youtube_apis/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'video_list_tile.dart';
import '../../models/video.dart';

class VideoPlay extends StatefulWidget {
   VideoPlay({super.key, required this.video});

  Video video;

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}


class _VideoPlayState extends State<VideoPlay> {

  late YoutubePlayerController _controller;

   @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:'widget.video.videoId',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title ?? 'No Title'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
           onEnded: (metadata) {
            // Load the next video in the playlist when the current video ends
            final nextVideoId = widget.video.playlistNextVideoId;
            if (nextVideoId != null) {
              _controller.load(nextVideoId);
            }
           },
        ),
      ),
    );
  }
  
    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
