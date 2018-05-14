// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_object.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) =>
    new ImageObject()
      ..small = json['small'] as String
      ..large = json['large'] as String
      ..medium = json['medium'] as String;

abstract class _$ImageObjectSerializerMixin {
  String get small;
  String get large;
  String get medium;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('small', small);
    writeNotNull('large', large);
    writeNotNull('medium', medium);
    return val;
  }
}
