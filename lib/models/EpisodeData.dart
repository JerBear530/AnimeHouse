import 'package:json_annotation/json_annotation.dart';
import 'package:graphqltutorial/models/EpisodePagnationLinks.dart';
import 'Episode.dart';
part 'EpisodeData.g.dart';


@JsonSerializable(nullable: true)
class EpisodeData {

  final List<Episode> data;
  EpisodePagnationLinks links;


  EpisodeData ({this.data, this.links});

  factory EpisodeData.fromJson(Map<String, dynamic> json)=> _$EpisodeDataFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeDataToJson(this);
}