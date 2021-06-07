import 'package:inetum_ws/utils/date_parser.dart';

class Post {
  int id;
  String date;
  String time;
  String title;
  String body;
  int authorId;

  Post({this.id, this.date, this.time, this.title, this.body, this.authorId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        date: DateParser.getDate(json['date']),
        time: DateParser.getTime(json['date']),
        authorId: json['authorId']);
  }

}
