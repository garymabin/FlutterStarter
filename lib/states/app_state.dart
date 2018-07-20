
import 'package:meta/meta.dart';
import 'package:starter/states/book_list_state.dart';

@immutable
class AppState {
  final BookListState bookListState;

  AppState(this.bookListState);

  factory AppState.initial() => AppState(BookListState.initial());

  factory AppState.loading() => AppState(BookListState.loading());
}

