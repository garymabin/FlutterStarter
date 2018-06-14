import 'package:starter/models/book_dto.dart';


class BookListState {
  final BookDTO books;
  final bool hasError;
  final bool isLoading;

  BookListState({this.books, this.hasError = false, this.isLoading = false});

  factory BookListState.initial() =>
      new BookListState(books: new BookDTO([], 0, 0, 0));

  factory BookListState.loading() =>
      new BookListState(isLoading: true);

  factory BookListState.error() =>
      new BookListState(hasError: true);
}
