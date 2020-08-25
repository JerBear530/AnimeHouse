// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EpisodeLinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeLinks _$EpisodeLinksFromJson(Map<String, dynamic> json) {
  return EpisodeLinks(
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EpisodeLinksToJson(EpisodeLinks instance) =>
    <String, dynamic>{
      'links': instance.links,
    };
