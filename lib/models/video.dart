class Video {
  String? title;
  String? description;
  String? thumbnail;
  String? publishedData;
  String? videoId;
  String? playlistNextVideoId;

  Video.fromJson(Map<String, dynamic> json) {
    videoId = json['id']['videoId'];
    playlistNextVideoId = json['id']['playlistNextVideoId'];
    title = json['title'];
    description = json['description'];
    publishedData = json['publishedAt'];
    thumbnail = json['thumbnails'].isNotEmpty
        ? json['thumbnails']['maxres']['url']
        : 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Ferror-rubber-stamp-word-error-inside-illustration-109026446.jpg&tbnid=jvO0i4u9gUsxjM&vet=12ahUKEwi6vbmX7v_9AhV9UKQEHT3uBjwQMygFegUIARDwAQ..i&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Ferror-rubber-stamp-word-error-inside-illustration-image109026446&docid=m6SQuM6ffty6XM&w=800&h=536&q=error&ved=2ahUKEwi6vbmX7v_9AhV9UKQEHT3uBjwQMygFegUIARDwAQ';
  }
}
