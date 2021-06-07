import 'dart:convert';

import 'package:inetum_ws/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:inetum_ws/utils/constants.dart' as URL;

class PostService {
  static Future<Post> getPostByAuthorId(int authorId) async {
    Post post;
    Uri url = Uri.parse(URL.URL_GET_POSTS + "?authorId=" + authorId.toString());
    var response = await http.get(url);

    if (response.statusCode == 200) {
      post = Post.fromJson(json.decode(response.body)[0]);
    } else {
      print('Response status: ${response.statusCode}');
      throw Exception('Failed to load Authors');
    }
    return post;
  }
}
