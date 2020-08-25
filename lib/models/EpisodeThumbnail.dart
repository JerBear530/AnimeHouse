import 'package:json_annotation/json_annotation.dart';
part 'EpisodeThumbnail.g.dart';


@JsonSerializable(nullable: true)
class EpisodeThumbnail {

  @JsonKey(nullable: true)
  String original;

  EpisodeThumbnail({this.original});

  factory EpisodeThumbnail.fromJson(Map<String, dynamic> json)=> _$EpisodeThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeThumbnailToJson(this);
}