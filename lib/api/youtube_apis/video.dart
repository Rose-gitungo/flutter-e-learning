import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Response> getYoutubeVideos(Dio client) async {
  final jsonString = await rootBundle.loadString('lib/secrets.json');
  final data = json.decode(jsonString);

  String apiKey = data['api_key'];

  return client.get('/playlistItems', queryParameters: {
    'key': apiKey,
    'method': 'GET',
    'playlistId': 'PLmWMBbk5o0KV7Z_gAuzgbt8X-2K2pjxBm',
    'part': 'snippet',
    'maxResults': 50,
  });
}
