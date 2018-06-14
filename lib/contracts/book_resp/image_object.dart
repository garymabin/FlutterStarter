import 'package:json_annotation/json_annotation.dart';

part 'image_object.g.dart';


@JsonSerializable(includeIfNull: false)
class ImageObject extends Object with _$ImageObjectSerializerMixin {
  String small;
  String large;
  String medium;

  ImageObject();

  factory ImageObject.fromJson(Map<String, dynamic> json) => _$ImageObjectFromJson(json);
}
