import 'package:starter/book_item.dart';

class BookDTO {
  List<BookItem> books;
  int count;
  int start;
  int total;

  BookDTO(this.books, this.count, this.start, this.total);
}
