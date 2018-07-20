import 'package:starter/book_repository.dart';
import 'package:starter/models/book_dto.dart';
import 'package:starter/states/book_list_state.dart';

class StartLoadingBookListAction {
}

class LoadingBookListAction {
}

class FinishLoadingBookListAction {
  final BookListState bookListState;

  FinishLoadingBookListAction(this.bookListState);
}

class ErrorLoadingBookListAction {
}
