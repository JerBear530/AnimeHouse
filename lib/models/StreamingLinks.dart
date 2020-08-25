import 'package:json_annotation/json_annotation.dart';
import 'Links.dart';
part 'StreamingLinks.g.dart';

  @JsonSerializable()
  class StreamingLinks{
  Links links;

  StreamingLinks({this.links});

  factory StreamingLinks.fromJson(Map<String,dynamic>json)=> _$StreamingLinksFromJson(json);
  Map<String,dynamic> toJson()=>_$StreamingLinksToJson(this);

  }