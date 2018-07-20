import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildRatingBar(ThemeData theme, double rating) {
  var starList = new List<Widget>.generate(5, (i) {
    var color = i <= rating ? theme.accentColor : Colors.black12;
    return new Icon(
        Icons.star,
        color: color);
  });
  return new Row(children: starList);
}
