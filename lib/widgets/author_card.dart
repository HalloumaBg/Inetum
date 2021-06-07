import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inetum_ws/models/author.dart';
import 'package:inetum_ws/views/author_details_page.dart';

class AuthorCard extends StatelessWidget {
  final Author author;

  AuthorCard({this.author});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AuthorDetailsPage(author: author))),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(author.avatarUrl),
          ),
          title: Text(author.name),
          subtitle: Text(author.email),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
