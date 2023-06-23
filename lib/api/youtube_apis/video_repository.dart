import 'package:dio/dio.dart';
import 'package:little_happyfish/api/youtube_apis/client.dart';
import 'package:little_happyfish/api/youtube_apis/video.dart';

class VideoRepository {
  late Dio dio;

  VideoRepository() {
    dio = client();
  }

  Future<Response> fetchAllVideos() async {
    return await getYoutubeVideos(dio);
  }
}
