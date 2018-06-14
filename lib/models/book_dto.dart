import 'package:starter/models/book_item.dart';

class BookDTO {
  final List<BookItem> books;
  final int count;
  final int start;
  final int total;

  BookDTO(this.books, this.count, this.start, this.total);
}
