import 'package:json_annotation/json_annotation.dart';
part 'Links.g.dart';

  @JsonSerializable(nullable: true)
  class Links{
    String self;
    String related;

    Links({this.self,this.related});

    factory Links.fromJson(Map<String,dynamic>json)=> _$LinksFromJson(json);
    Map<String,dynamic> toJson()=>_$LinksToJson(this);

  }