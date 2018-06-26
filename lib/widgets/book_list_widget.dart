import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starter/models/book_dto.dart';
import 'package:starter/widgets/book_list_item_widget.dart';

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
              return new BookListItemWidget(item);
            }));
  }
}
