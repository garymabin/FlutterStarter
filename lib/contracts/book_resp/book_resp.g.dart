// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_resp.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BookResp _$BookRespFromJson(Map<String, dynamic> json) => new BookResp(
    json['count'] as int,
    json['start'] as int,
    json['total'] as int,
    (json['books'] as List)
        ?.map((e) => e == null
            ? null
            : new BookObject.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$BookRespSerializerMixin {
  int get count;
  int get start;
  int get total;
  List<BookObject> get books;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'start': start,
        'total': total,
        'books': books
      };
}
