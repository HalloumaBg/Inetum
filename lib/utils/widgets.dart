import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widgets {
  static BoxDecoration customBoxDecoration(String networkImageUrl) {
    return BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
            image: NetworkImage(networkImageUrl),
            fit: BoxFit.cover));
  }

  static Row textWithIcon(IconData icon, Color color, String text, TextStyle textStyle) {
    return Row(children: <Widget>[
      Icon(icon, color: color, size: 15),
      Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
      Text(text, textAlign: TextAlign.justify, style: textStyle)
    ]);
  }
}
