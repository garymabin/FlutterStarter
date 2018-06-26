import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildRatingBar(ThemeData theme, double rating) {
  var stars = <Widget>[];

  for (var i = 1; i <= 5; i++) {
    var color = i <= rating ? theme.accentColor : Colors.black12;
    var star = new Icon(
      Icons.star,
      color: color,
    );

    stars.add(star);
  }

  return new Row(children: stars);
}
