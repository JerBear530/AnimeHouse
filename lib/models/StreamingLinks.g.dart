// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StreamingLinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingLinks _$StreamingLinksFromJson(Map<String, dynamic> json) {
  return StreamingLinks(
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreamingLinksToJson(StreamingLinks instance) =>
    <String, dynamic>{
      'links': instance.links,
    };
