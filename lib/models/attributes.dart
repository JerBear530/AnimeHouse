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
  int episodeLength;
  int favoritesCount;
  int popularityRank;
  String ageRating;
  String status;
  String startDate;
  String endDate;
  String youtubeVideoId;
  String showType;
  String synopsis;




  @JsonKey(nullable: true)
  int episodeCount;
  Titles titles;
  PosterImage posterImage;
  CoverImage coverImage;





  Attributes({this.synopsis,this.createdAt,this.updatedAt,this.slug,this.titles, this.posterImage,this.coverImage,this.canonicalTitle,this.averageRating,this.ageRating,this.endDate,this.episodeCount,this.episodeLength,this.favoritesCount,this.popularityRank,this.showType,this.startDate,this.status,this.youtubeVideoId,});
  factory Attributes.fromJson(Map<String,dynamic> json)=>_$AttributesFromJson(json);
  Map<String, dynamic> toJson()=>_$AttributesToJson(this);

  Map<String,dynamic> okay2(){
    return{
      'averageRating':this.averageRating,
      'createdAt': this.createdAt,
      'updatedAt':this.updatedAt,
      'slug':this.slug,
      'canonicalTitle': this.canonicalTitle,
      'episodeLength': this.episodeLength,
      'favoritesCount':this.favoritesCount,
      'popularityRank': this.popularityRank,
      'ageRating': this.ageRating,
      'status': this.status,
      'startDate':this.startDate,
      'endDate': this.endDate,
      'youtubeVideoId':this.youtubeVideoId,
      'showType': this.showType,
      'synopsis': this.synopsis,
      'episodeCount': this.episodeCount,




    };

  }
}


