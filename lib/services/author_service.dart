import 'dart:convert';
import 'package:inetum_ws/models/author.dart';
import 'package:inetum_ws/utils/constants.dart' as URL;
import 'package:http/http.dart' as http;

abstract class AuthorRepo {
  Future<List<Author>> getAuthorsList();
}

class AuthorService implements AuthorRepo {

   Future<List<Author>> getAuthorsList() async {
    List<Author> list = [];

    var response = await http.get(Uri.parse(URL.URL_GET_AUTHORS));
    if (response.statusCode == 200) {
      for (var jsonObj in json.decode(response.body))
        list.add( Author.fromJson(jsonObj));
    } else {
      print('Response status: ${response.statusCode}');
      throw Exception('Failed to load Authors');
    }
    return list;
  }
}
