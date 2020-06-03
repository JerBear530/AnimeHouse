import 'package:json_annotation/json_annotation.dart';
part 'PosterImage.g.dart';

@JsonSerializable()
class PosterImage{
  String small;
  String medium;

  PosterImage({this.small,this.medium});
  factory PosterImage.fromJson(Map<String,dynamic>json)=> _$PosterImageFromJson(json);
  Map<String, dynamic> toJson() => _$PosterImageToJson(this);
}