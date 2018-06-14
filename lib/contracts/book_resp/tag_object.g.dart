// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_object.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TagObject _$TagObjectFromJson(Map<String, dynamic> json) => new TagObject()
  ..count = json['count'] as int
  ..name = json['name'] as String
  ..title = json['title'] as String;

abstract class _$TagObjectSerializerMixin {
  int get count;
  String get name;
  String get title;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('count', count);
    writeNotNull('name', name);
    writeNotNull('title', title);
    return val;
  }
}
