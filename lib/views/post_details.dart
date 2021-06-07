import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inetum_ws/models/post.dart';
import 'package:inetum_ws/services/post_service.dart';
import 'package:inetum_ws/utils/style.dart';
import 'package:inetum_ws/utils/widgets.dart';

class PostDetails extends StatefulWidget {
  final int authorId;

  const PostDetails({Key key, @required this.authorId}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  Post post;

  @override
  void initState() {
    post = Post(title: "", body: "", date: "", time: "");
    PostService.getPostByAuthorId(widget.authorId)
        .then((value) => {setState(() => post = value)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Widgets.textWithIcon(
              Icons.date_range, Colors.grey, post.date, Style.sGreyText),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Widgets.textWithIcon(
              Icons.access_time, Colors.grey, post.time, Style.sGreyText),
        ]),
        Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(post.title, style: Style.blackTitle),
        Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(post.body, textAlign: TextAlign.justify)
      ]),
    );
  }
}
