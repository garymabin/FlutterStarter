import 'package:redux/redux.dart';
import 'package:starter/actions/actions.dart';
import 'package:starter/states/book_list_state.dart';

final bookListReducers = combineReducers<BookListState>([
  TypedReducer<BookListState, StartLoadingBookListAction>
    (_startLoadingBookList),
  TypedReducer<BookListState, LoadingBookListAction>(_loadingBookList),
  TypedReducer<BookListState, FinishLoadingBookListAction>
    (_finishLoadingBookList)
]);

BookListState _loadingBookList(BookListState state, LoadingBookListAction action) {
  return BookListState.loading();
}

BookListState _startLoadingBookList(BookListState state, StartLoadingBookListAction action) {
  return BookListState.initial();
}

BookListState _finishLoadingBookList(BookListState state, FinishLoadingBookListAction action) {
  return action.bookListState;
}
