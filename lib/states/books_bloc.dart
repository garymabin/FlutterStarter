import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:starter/models/book_dto.dart';
import 'package:starter/book_repository.dart';
import 'package:starter/loading_action.dart';
import 'package:starter/states/book_list_state.dart';

class BooksBloc {
  final Sink<LoadingAction> pullToRefresh;
  final Stream<BookListState> state;

  BooksBloc._(this.pullToRefresh, this.state);

  factory BooksBloc(BookRepository repository) {
    final pullToRefresh = new StreamController<LoadingAction>();

    final state = new Observable<LoadingAction>(pullToRefresh.stream)
        .debounce(const Duration(milliseconds: 250))
        .switchMap(_buildBooksStateStream(repository))
        .startWith(new BookListState.initial());
    return new BooksBloc._(pullToRefresh, state);
  }

  static Stream<BookListState> Function(LoadingAction) _buildBooksStateStream(
      BookRepository repository) {
    return (LoadingAction loadingAction) {
      return new Observable<BookDTO>.fromFuture(
              repository.getBooks(loadingAction.startingIndex))
          .map<BookListState>((BookDTO resp) {
            loadingAction.onFinished();
            return new BookListState(
                books: resp, hasError: false, isLoading: false);
          })
          .doOnError(loadingAction.onFinished)
          .onErrorReturn(new BookListState.error())
          .startWith(new BookListState.loading());
    };
  }

  void dispose() {
    pullToRefresh.close();
  }
}
