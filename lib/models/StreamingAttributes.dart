

import 'package:json_annotation/json_annotation.dart';

part 'StreamingAttributes.g.dart';

@JsonSerializable(nullable: true)
class StreamingAttributes {

  String url;


  StreamingAttributes({this.url});

  factory StreamingAttributes.fromJson(Map<String, dynamic> json)=> _$StreamingAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$StreamingAttributesToJson(this);
}