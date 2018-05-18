import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starter/book_dto.dart';

class BookListWidget extends StatelessWidget {
  final BookDTO bookResp;

  BookListWidget(this.bookResp);

  @override
  Widget build(BuildContext context) {
    return new AnimatedOpacity(
        opacity: 1.0,
        duration: new Duration(milliseconds: 300),
        child: new ListView.builder(
            itemCount: bookResp?.books?.length ?? 0,
            itemBuilder: (context, index) {
              final item = bookResp.books[index];
              return new Container(
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0))),
                            new Text(item.information,
                                style: new TextStyle(fontSize: 13.0)),
                            new Container(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: new Row(children: <Widget>[
                                  _buildRatingBar(
                                      Theme.of(context), item.rating),
                                  new Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: new Text(item.rating.toString(),
                                          style: new TextStyle(fontSize: 12.0)))
                                ])),
                            new Text(item.summary,
                                style: new TextStyle(fontSize: 12.0),
                                maxLines: 3),
                          ],
                        ))
                  ]));
            }));
  }

  _buildRatingBar(ThemeData theme, double rating) {
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
}
