import 'package:json_annotation/json_annotation.dart';
part 'CoverImage.g.dart';

@JsonSerializable()
  class CoverImage{

    String small;
    String large;
    String original;

    CoverImage({this.small,this.large,this.original});
      factory CoverImage.fromJson(Map<String,dynamic>json)=> _$CoverImageFromJson(json);
      Map<String,dynamic> toJson()=>_$CoverImageToJson(this);

}