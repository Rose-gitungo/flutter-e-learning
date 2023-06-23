import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:little_happyfish/api/youtube_apis/video_repository.dart';
import 'package:little_happyfish/models/video.dart';
import 'package:little_happyfish/api/youtube_apis/video.dart';
import 'package:little_happyfish/api/youtube_apis/client.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository();

  Future<List<Video>> fetchVideos() async {
    var response = await _videoRepository.fetchAllVideos();
    return List<Video>.from((response.data['items'])
        .map((json) => Video.fromJson(json['snippet'])));
  }

//   Future<List<Video>> fetchVideos() async {
//     var response = await _videoRepository.fetchAllVideos();
// //to parse json and return map
//     // return List<Video>.from((response.data()['items'])
//     return List<Video>.from((response.data['items'])
//         .map((json) => Video.fromJson(json['snippet'])));
//   }
}
