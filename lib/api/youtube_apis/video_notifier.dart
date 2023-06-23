import 'package:flutter/cupertino.dart';
import 'package:little_happyfish/api/youtube_apis/video_service.dart';
import 'package:little_happyfish/models/video.dart';

class VideoNotifier extends ChangeNotifier {
  List<Video> _videoList = [];
  List<Video> get videoList => _videoList;

  final VideoService _videoService = VideoService();

  Future<void> fetchVideos() async {
    _videoList = await _videoService.fetchVideos();
    notifyListeners();
  }
}
