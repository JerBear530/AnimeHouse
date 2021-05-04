import 'package:json_annotation/json_annotation.dart';
part 'EpisodePagnationLinks.g.dart';


@JsonSerializable(nullable: true)
class EpisodePagnationLinks {

  @JsonKey(nullable: true)
  String first;
  @JsonKey(nullable: true)
  String next;
  @JsonKey(nullable: true)
  String last;


  EpisodePagnationLinks ({this.first,this.next,this.last});

  factory EpisodePagnationLinks.fromJson(Map<String, dynamic> json)=> _$EpisodePagnationLinksFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodePagnationLinksToJson(this);
}