import 'file:///C:/Users/rober/AndroidStudioProjects/graphqltutorial/lib/models/Episode.dart';
import 'package:json_annotation/json_annotation.dart';
import 'EpisodeAttributes.dart';
part 'EpisodeData.g.dart';


@JsonSerializable(nullable: true)
class EpisodeData {

  final List<Episode> data;


  EpisodeData ({this.data});

  factory EpisodeData.fromJson(Map<String, dynamic> json)=> _$EpisodeDataFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeDataToJson(this);
}