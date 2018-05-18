import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starter/states/book_list_state.dart';
import 'package:starter/widgets/book_list_widget.dart';

class BookWidget extends StatelessWidget {

  final Stream<BookListState> state;

  BookWidget({Key key, this.state}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<BookListState>(
      stream: state,
      initialData: new BookListState.initial(),
      builder: (BuildContext context, AsyncSnapshot<BookListState> snapshot) {
        final model = snapshot.data;
        return new BookListWidget(model.books);
      }
    );
  }

}
