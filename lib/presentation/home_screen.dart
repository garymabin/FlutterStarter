import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:starter/actions/actions.dart';
import 'package:starter/book_repository.dart';
import 'package:starter/models/book_dto.dart';
import 'package:starter/selectors/selectors.dart';
import 'package:starter/states/app_state.dart';
import 'package:starter/states/book_list_state.dart';
import 'package:starter/widgets/book_list_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
      return _ViewModel.fromStore(store);
    }, builder: (BuildContext context, _ViewModel viewModel) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
          ),
          body: new RefreshIndicator(
              key: _refreshIndicatorKey,
              child: new BookListWidget(viewModel.bookListState.books),
              onRefresh: () => _handleRefresh(viewModel: viewModel)));
    });
  }

  Future<Null> _handleRefresh({@required _ViewModel viewModel}) {
    final Completer<Null> completer = new Completer<Null>();
    viewModel.onLoadBookList(20, completer: completer);
    return completer.future;
  }
}

class _ViewModel {
  final BookListState bookListState;
  final Function(int, {@required Completer<Null>
  completer}) onLoadBookList;

  _ViewModel({@required this.bookListState, @required this.onLoadBookList});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        bookListState: bookListStateSelector(store.state),
        onLoadBookList: (start, {@required Completer<Null> completer}) {
          BookRepository repository = BookRepository.peekBookRepository();
          store.dispatch(StartLoadingBookListAction());

          repository.getBooks(start).then((BookDTO resp) {
            completer.complete(null);
            store.dispatch(FinishLoadingBookListAction(
                BookListState(books: resp, hasError: false, isLoading: false)));
          }).catchError((error) {
            completer.complete(null);
            store.dispatch(ErrorLoadingBookListAction());
          });
        });
  }
}
