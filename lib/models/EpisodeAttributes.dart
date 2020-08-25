import 'package:json_annotation/json_annotation.dart';
import 'EpisodeThumbnail.dart';
part 'EpisodeAttributes.g.dart';


@JsonSerializable(nullable: true)
class EpisodeAttributes {


  int seasonNumber;
  int number;
  EpisodeThumbnail thumbnail;


  EpisodeAttributes({this.seasonNumber,this.number,this.thumbnail});

  factory EpisodeAttributes.fromJson(Map<String, dynamic> json)=> _$EpisodeAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeAttributesToJson(this);
}