

import 'package:json_annotation/json_annotation.dart';
import 'StreamingAttributes.dart';
part 'Streaming.g.dart';

@JsonSerializable(nullable: true)
class Streaming {

  String id;
  String type;
  StreamingAttributes attributes;

  Streaming({this.id,this.type,this.attributes});

  factory Streaming.fromJson(Map<String, dynamic> json)=> _$StreamingFromJson(json);
  Map<String, dynamic> toJson() => _$StreamingToJson(this);
}