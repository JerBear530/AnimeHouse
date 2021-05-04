// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EpisodeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeData _$EpisodeDataFromJson(Map<String, dynamic> json) {
  return EpisodeData(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Episode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    links: json['links'] == null
        ? null
        : EpisodePagnationLinks.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EpisodeDataToJson(EpisodeData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
    };
