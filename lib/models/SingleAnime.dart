import 'package:json_annotation/json_annotation.dart';
import 'Links.dart';
import 'Relationships.dart';
import 'attributes.dart';
part 'SingleAnime.g.dart';


@JsonSerializable()
class SingleAnime {

  String id;
  String type;
  Links links;
  Attributes attributes;
  Relationships relationships;

  SingleAnime({this.id,this.type,this.links,this.attributes,this.relationships});

  factory SingleAnime.fromJson(Map<String, dynamic> json)=> _$SingleAnimeFromJson(json);
  Map<String, dynamic> toJson() => _$SingleAnimeToJson(this);
}