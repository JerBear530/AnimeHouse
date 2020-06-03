import 'package:json_annotation/json_annotation.dart';

import 'CoverImage.dart';
import 'PosterImage.dart';
import 'Titles.dart';


part 'attributes.g.dart';

@JsonSerializable()
class Attributes{
  String averageRating;
  String createdAt;
  String updatedAt;
  String slug;
  String canonicalTitle;

  @JsonKey(nullable: true)
  Titles titles;

  PosterImage posterImage;
  CoverImage coverImage;
  Attributes({this.createdAt,this.updatedAt,this.slug,this.titles, this.posterImage,this.coverImage,this.canonicalTitle});
  factory Attributes.fromJson(Map<String,dynamic> json)=>_$AttributesFromJson(json);
  Map<String, dynamic> toJson()=>_$AttributesToJson(this);
}


