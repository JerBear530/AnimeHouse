// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EpisodeAttributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeAttributes _$EpisodeAttributesFromJson(Map<String, dynamic> json) {
  return EpisodeAttributes(
    seasonNumber: json['seasonNumber'] as int,
    number: json['number'] as int,
    thumbnail: json['thumbnail'] == null
        ? null
        : EpisodeThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EpisodeAttributesToJson(EpisodeAttributes instance) =>
    <String, dynamic>{
      'seasonNumber': instance.seasonNumber,
      'number': instance.number,
      'thumbnail': instance.thumbnail,
    };
