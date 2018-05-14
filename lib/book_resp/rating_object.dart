import 'package:json_annotation/json_annotation.dart';


part 'rating_object.g.dart';


@JsonSerializable(includeIfNull: false)
class RatingObject extends Object with _$RatingObjectSerializerMixin {
  int max;
  int numRaters;
  int average;
  int min;

  RatingObject();

  factory RatingObject.fromJson(Map<String, dynamic> json) => _$RatingObjectFromJson(json);
}
