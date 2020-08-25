import 'package:json_annotation/json_annotation.dart';
part 'Titles.g.dart';

@JsonSerializable(nullable: true)
class Titles{
  @JsonKey(nullable: true)
  String en;
  String ja_jp;

  Titles({this.en,this.ja_jp});
  factory Titles.fromJson(Map<String,dynamic>json)=> _$TitlesFromJson(json);
  Map<String, dynamic> toJson() => _$TitlesToJson(this);
}