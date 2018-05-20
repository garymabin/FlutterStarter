import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:starter/book_dto.dart';
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
      Function loadingFinished =
          () => (loadingAction.extraData as Completer<Null>).complete();
      return new Observable<BookDTO>.fromFuture(
              repository.getBooks(loadingAction.startingIndex))
          .map<BookListState>((BookDTO resp) {
            loadingFinished();
            return new BookListState(
                books: resp, hasError: false, isLoading: false);
          })
          .doOnError(loadingFinished)
          .onErrorReturn(new BookListState.error())
          .startWith(new BookListState.loading());
    };
  }

  void dipose() {
    pullToRefresh.close();
  }
}
