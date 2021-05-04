
import 'package:graphqltutorial/models/Anime.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SingleAnimeCollection.g.dart';

@JsonSerializable(nullable: true)
class SingleAnimeCollection {

  final Anime data;

  SingleAnimeCollection ({this.data});

  factory SingleAnimeCollection .fromJson(Map<String, dynamic> json)=> _$SingleAnimeCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$SingleAnimeCollectionToJson(this);
}