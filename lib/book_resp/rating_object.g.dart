// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_object.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

RatingObject _$RatingObjectFromJson(Map<String, dynamic> json) =>
    new RatingObject()
      ..max = json['max'] as int
      ..numRaters = json['numRaters'] as int
      ..average = json['average'] as int
      ..min = json['min'] as int;

abstract class _$RatingObjectSerializerMixin {
  int get max;
  int get numRaters;
  int get average;
  int get min;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('max', max);
    writeNotNull('numRaters', numRaters);
    writeNotNull('average', average);
    writeNotNull('min', min);
    return val;
  }
}
