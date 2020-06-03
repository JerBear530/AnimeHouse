
import 'package:json_annotation/json_annotation.dart';
import 'Anime.dart';
part 'PopularAnimeCollection.g.dart';


@JsonSerializable(nullable: true)
class PopularAnimeCollection {
  final List<Anime> data;

  PopularAnimeCollection({this.data});

  factory PopularAnimeCollection.fromJson(Map<String, dynamic> json)=> _$PopularAnimeCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$PopularAnimeCollectionToJson(this);
}

/*class Anime{
  String id;
  String type;
  attributes attributess;
  Anime({this.id,this.type,this.attributess});
  factory Anime.fromJson(Map<String, dynamic> json){
    return Anime(
      id: json['id'],
      type: json['type'],
      attributess: attributes.fromJson(json['attributes'])

    );
  }



}

class Attributes{
  String averageRating;
  String createdAt;
  String updatedAt;
  String slug;
  Titles titles;
  PosterImage posterImage;
  CoverImage coverImage;
  Attributes({this.createdAt,this.updatedAt,this.slug,this.titles, this.posterImage,this.coverImage});
  factory Attributes.fromJson(Map <String,dynamic>json){
    return Attributes(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      slug: json['slug'],
      titles: Titles.fromJson(json['titles']),
      posterImage: PosterImage.fromJson(json['posterImage']),
   coverImage: CoverImage.fromJson(json['coverImage']) ,


    );

  }

}

class Titles{
  String en;
  String ja_jp;

  Titles({this.en,this.ja_jp});
  factory Titles.fromJson(Map<String,dynamic>json){
    return Titles(
      en: json['en'],
      ja_jp: json['ja_jp']
    );
  }
}

class PosterImage{
  String small;
  String medium;

  PosterImage({this.small,this.medium});
  factory PosterImage.fromJson(Map<String,dynamic>json){
    return PosterImage(
      small: json['small'],
      medium: json['medium']

    );
  }
}

class CoverImage{
  String small;
  String large;
  CoverImage({this.small,this.large});
    factory CoverImage.fromJson(Map<String,dynamic>json){
      return CoverImage(
        small: json['small'],
        large: json['large']?? json['']
      ) ;
    }
}


*/