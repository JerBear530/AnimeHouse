import 'attributes.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Anime.g.dart';

@JsonSerializable(nullable: true)
class Anime{
  String id;
  String type;
  Attributes attributes;
  Anime({this.id,this.type,this.attributes});
  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}