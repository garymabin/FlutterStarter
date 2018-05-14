// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_object.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BookObject _$BookObjectFromJson(Map<String, dynamic> json) => new BookObject()
  ..rating = new RatingObject.fromJson(json['rating'] as Map<String, dynamic>)
  ..subtitle = json['subtitle'] as String
  ..pubdate = json['pubdate'] as String
  ..origin_title = json['origin_title'] as String
  ..image = json['image'] as String
  ..binding = json['binding'] as String
  ..catalog = json['catalog'] as String
  ..pages = json['pages'] as String
  ..images = new ImageObject.fromJson(json['images'] as Map<String, dynamic>)
  ..alt = json['alt'] as String
  ..id = json['id'] as String
  ..publisher = json['publisher'] as String
  ..isbn10 = json['isbn10'] as String
  ..isbn13 = json['isbn13'] as String
  ..title = json['title'] as String
  ..url = json['url'] as String
  ..alt_title = json['alt_title'] as String
  ..author_intro = json['author_intro'] as String
  ..summary = json['summary'] as String
  ..price = json['price'] as String
  ..author = (json['author'] as List).map((e) => e as String).toList()
  ..tags = (json['tags'] as List)
      .map((e) => new TagObject.fromJson(e as Map<String, dynamic>))
      .toList()
  ..translator = json['translator'] as List;

abstract class _$BookObjectSerializerMixin {
  RatingObject get rating;
  String get subtitle;
  String get pubdate;
  String get origin_title;
  String get image;
  String get binding;
  String get catalog;
  String get pages;
  ImageObject get images;
  String get alt;
  String get id;
  String get publisher;
  String get isbn10;
  String get isbn13;
  String get title;
  String get url;
  String get alt_title;
  String get author_intro;
  String get summary;
  String get price;
  List<String> get author;
  List<TagObject> get tags;
  List<dynamic> get translator;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'rating': rating,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('subtitle', subtitle);
    writeNotNull('pubdate', pubdate);
    writeNotNull('origin_title', origin_title);
    writeNotNull('image', image);
    writeNotNull('binding', binding);
    writeNotNull('catalog', catalog);
    writeNotNull('pages', pages);
    val['images'] = images;
    writeNotNull('alt', alt);
    writeNotNull('id', id);
    writeNotNull('publisher', publisher);
    writeNotNull('isbn10', isbn10);
    writeNotNull('isbn13', isbn13);
    writeNotNull('title', title);
    writeNotNull('url', url);
    writeNotNull('alt_title', alt_title);
    writeNotNull('author_intro', author_intro);
    writeNotNull('summary', summary);
    writeNotNull('price', price);
    val['author'] = author;
    val['tags'] = tags;
    writeNotNull('translator', translator);
    return val;
  }
}
