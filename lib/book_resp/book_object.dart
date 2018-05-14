import 'package:json_annotation/json_annotation.dart';
import 'package:starter/book_resp/image_object.dart';
import 'package:starter/book_resp/rating_object.dart';
import 'package:starter/book_resp/tag_object.dart';

part 'book_object.g.dart';

@JsonSerializable(includeIfNull: false)
class BookObject extends Object with _$BookObjectSerializerMixin {
  @JsonKey(nullable: false)
  RatingObject rating;
  String subtitle;
  String pubdate;
  String origin_title;
  String image;
  String binding;
  String catalog;
  String pages;
  @JsonKey(nullable: false)
  ImageObject images;
  String alt;
  String id;
  String publisher;
  String isbn10;
  String isbn13;
  String title;
  String url;
  String alt_title;
  String author_intro;
  String summary;
  String price;
  @JsonKey(nullable: false)
  List<String> author;
  @JsonKey(nullable: false)
  List<TagObject> tags;
  List translator;

  BookObject();

  factory BookObject.fromJson(Map<String, dynamic> json) =>
      _$BookObjectFromJson(json);
}
