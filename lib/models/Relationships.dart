import 'package:json_annotation/json_annotation.dart';
import 'EpisodeLinks.dart';
import 'StreamingLinks.dart';
part 'Relationships.g.dart';

  @JsonSerializable()
  class Relationships{
    StreamingLinks streamingLinks;
    EpisodeLinks episodes;

    Relationships({this.streamingLinks,this.episodes});

    factory Relationships.fromJson(Map<String,dynamic>json)=> _$RelationshipsFromJson(json);
    Map<String,dynamic> toJson()=>_$RelationshipsToJson(this);

  }