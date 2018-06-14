import 'dart:async';

import 'package:starter/api/douban_service.dart';
import 'package:starter/models/book_dto.dart';
import 'package:starter/models/book_item.dart';
import 'package:starter/contracts/book_resp/book_resp.dart';
import 'package:starter/contracts/book_store_contract.dart';

class BookRepository {
  final BookStoreContract bookStoreContract;

  BookRepository.withBookStore(bookStoreContract)
      : this.bookStoreContract = bookStoreContract ?? new DoubanService();

  BookRepository() : this.withBookStore(null);

  Future<BookDTO> getBooks(int start) {
    Future<BookResp> books = bookStoreContract.getBooks(start, 20, 'IT');

    return books.then((bookResp) {
      return new BookDTO(
        bookResp.books
            .map((bookObject) => new BookItem.from(bookObject))
            .toList(),
        bookResp.count,
        bookResp.start,
        bookResp.total,
      );
    });
  }
}
