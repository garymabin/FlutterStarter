import 'package:starter/contracts/book_resp/book_object.dart';

class BookItem {
  final String title;
  final String information;
  final String image;
  final double rating;
  final String summary;

  BookItem._(this.title, this.information, this.image, this.rating, this
      .summary);

  factory BookItem.from(BookObject bookObject) {
    var actualRating = double.parse(bookObject.rating.average) / 2.0;
    var information = [bookObject.author.toString(), bookObject.publisher,
    bookObject.pubdate].join("/");
    return new BookItem._(bookObject.title, information, bookObject.images
        .large, actualRating, bookObject.summary);
  }
}
