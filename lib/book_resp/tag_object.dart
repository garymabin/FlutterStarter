import 'package:json_annotation/json_annotation.dart';

part 'tag_object.g.dart';

@JsonSerializable(includeIfNull: false)
class TagObject extends Object with _$TagObjectSerializerMixin {
  int count;
  String name;
  String title;

  TagObject();

  factory TagObject.fromJson(Map<String, dynamic> json) => _$TagObjectFromJson(json);
}
