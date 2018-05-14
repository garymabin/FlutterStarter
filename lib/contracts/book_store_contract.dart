import 'dart:async';

import 'package:starter/annotations/path.dart';
import 'package:starter/book_resp/book_resp.dart';

abstract class BookStoreContract {
  @Path("/v2/book/search")
  //TODO: hope dart will make runtime reflection work soon
  Future<BookResp> getBooks(int start, int count, String tag);
}
