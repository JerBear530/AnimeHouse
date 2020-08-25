
import 'file:///C:/Users/rober/AndroidStudioProjects/graphqltutorial/lib/models/Links.dart';
import 'package:json_annotation/json_annotation.dart';
import 'StreamingLinks.dart';
part 'EpisodeLinks.g.dart';


@JsonSerializable()
class EpisodeLinks{
  Links links;

  EpisodeLinks({this.links});

  factory EpisodeLinks.fromJson(Map<String,dynamic>json)=> _$EpisodeLinksFromJson(json);
  Map<String,dynamic> toJson()=>_$EpisodeLinksToJson(this);

}