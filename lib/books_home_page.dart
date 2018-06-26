import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starter/book_repository.dart';
import 'package:starter/loading_action.dart';
import 'package:starter/states/books_bloc.dart';
import 'package:starter/widgets/book_widget.dart';

class _RxDartBooksAppState extends State<BooksHomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  BooksBloc bloc;

  Future<Null> _handleRefresh() {
    print("pull to refresh!");
    final Completer<Null> completer = new Completer<Null>();
    bloc.pullToRefresh.add(new LoadingAction(
        0, LoadingAction.LOADING_ACTION_REFRESH,
        onFinished: completer.complete));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new RefreshIndicator(
            key: _refreshIndicatorKey,
            child: new BookWidget(state: bloc.state),
            onRefresh: this._handleRefresh));
  }

  @override
  void initState() {
    super.initState();
    bloc = new BooksBloc(widget.repository);
    _initialLoading();
  }

  _initialLoading() async {
    _refreshIndicatorKey.currentState.show();
  }

  @override
  void didUpdateWidget(BooksHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}

class BooksHomePage extends StatefulWidget {
  final BookRepository repository;

  BooksHomePage({Key key, this.repository}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _RxDartBooksAppState();
}
