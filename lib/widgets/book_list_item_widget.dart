import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starter/book_detail_page.dart';
import 'package:starter/helper/ui_helper.dart';
import 'package:starter/main.dart';
import 'package:starter/models/book_item.dart';

class BookListItemWidget extends StatelessWidget {
  final BookItem item;

  BookListItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () => Navigator.push(context, new AnimatedRoute(
            builder: (_) => new BookDetailPage(this.item))),
        child: new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Row(children: [
              new Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new Image.network(item.image,
                      width: 74.0, height: 108.0)),
              new Expanded(
                  child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: new Text(item.title,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0))),
                  new Text(item.information,
                      style: new TextStyle(fontSize: 13.0)),
                  new Container(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: new Row(children: <Widget>[
                        buildRatingBar(Theme.of(context), item.rating),
                        new Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: new Text(item.rating.toString(),
                                style: new TextStyle(fontSize: 12.0)))
                      ])),
                  new Text(item.summary,
                      style: new TextStyle(fontSize: 12.0), maxLines: 3),
                ],
              ))
            ])));
  }
}
