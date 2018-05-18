import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starter/book_list_state.dart';
import 'package:starter/book_repository.dart';
import 'package:starter/book_widget.dart';
import 'package:starter/books_bloc.dart';
import 'package:starter/loading_action.dart';

void main() => runApp(new MyApp(repository: new BookRepository()));

class _RxDartBooksAppState extends State<MyApp> {
  BooksBloc bloc;

  Future<Null> _handleRefresh() {
    final Completer<Null> completer = new Completer<Null>();
    bloc.pullToRefresh.add(new LoadingAction(0, LoadingAction
        .LOADING_ACTION_REFRESH));
    bloc.state.listen((BookListState state) {
      if (state.books.books.isNotEmpty) {
        completer.complete();
      }
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Flutter',
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Welcome to Flutter'),
            ),
            body: new RefreshIndicator(child:
            new BookWidget(state:bloc.state), onRefresh: this._handleRefresh)
        ));
  }

  @override
  void initState() {
    super.initState();
    bloc = new BooksBloc(widget.repository);
    bloc.pullToRefresh.add(new LoadingAction(0, LoadingAction
        .LOADING_ACTION_REFRESH));
  }
}

class MyApp extends StatefulWidget {
  final BookRepository repository;
  MyApp({Key key, this.repository}):super(key:key);

  @override
  State<StatefulWidget> createState() => new _RxDartBooksAppState();
}
