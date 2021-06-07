import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:inetum_ws/models/author.dart';
import 'package:inetum_ws/utils/style.dart';
import 'package:inetum_ws/utils/widgets.dart';
import 'package:inetum_ws/utils/constants.dart' as RT;
import 'package:inetum_ws/views/post_details.dart';

class AuthorDetailsPage extends StatefulWidget {
  final Author author;

  const AuthorDetailsPage({Key key, @required this.author}) : super(key: key);

  @override
  _AuthorDetailsPageState createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends State<AuthorDetailsPage> {
  Placemark placeMark;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
            children: [topCard(), PostDetails(authorId: widget.author.id)]),
      ),
    );
  }

  Widget topCard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: Widgets.customBoxDecoration(widget.author.avatarUrl),
      padding: EdgeInsets.only(top: 26, right: 16, left: 16, bottom: 24),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()),
            authorInfo(),
          ]),
    );
  }

  Column authorInfo() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
      Text(widget.author.name, style: Style.whiteTitle),
      Text("« " + widget.author.userName + " »", style: Style.sWhiteText),
      Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
      Widgets.textWithIcon(Icons.location_on_outlined, Colors.white,
          placeMark != null ? placeMark.name : RT.ADDRESS, Style.mWhiteText),
      Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
      Widgets.textWithIcon(
          Icons.email, Colors.white, widget.author.email, Style.mWhiteText)
    ]);
  }
}
