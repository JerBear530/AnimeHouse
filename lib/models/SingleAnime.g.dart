// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SingleAnime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleAnime _$SingleAnimeFromJson(Map<String, dynamic> json) {
  return SingleAnime(
    id: json['id'] as String,
    type: json['type'] as String,
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
    attributes: json['attributes'] == null
        ? null
        : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    relationships: json['relationships'] == null
        ? null
        : Relationships.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleAnimeToJson(SingleAnime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'links': instance.links,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };
