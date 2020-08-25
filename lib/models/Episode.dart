import 'package:json_annotation/json_annotation.dart';
import 'EpisodeAttributes.dart';
part 'Episode.g.dart';


@JsonSerializable(nullable: true)
class Episode {


  String id;
  String type;

  EpisodeAttributes attributes;


  Episode({this.id,this.type,this.attributes});

  factory Episode.fromJson(Map<String, dynamic> json)=> _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}