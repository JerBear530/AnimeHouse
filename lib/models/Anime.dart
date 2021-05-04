import 'Links.dart';
import 'attributes.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Relationships.dart';
part 'Anime.g.dart';

@JsonSerializable(nullable: true)
class Anime{
  String id;
  String type;
  Links links;
  Attributes attributes;
  Relationships relationships;

  @JsonKey(ignore: true)
  bool watching=false;

  @JsonKey(ignore: true)
  bool onHold=false;

  @JsonKey(ignore: true)
  bool wantToWatch=false;

  @JsonKey(ignore: true)
  bool dropped=false;

  @JsonKey(ignore: true)
  bool completed=false;

  @JsonKey(ignore: true)
  bool favorited=false;

  Anime({this.id,this.type,this.attributes,this.relationships,this.links});
  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeToJson(this);

  Map<String,dynamic> okay(){
    return{
      'id':this.id,
      'type':this.type,
      'attributes': this.attributes.okay2()
    };

  }
}