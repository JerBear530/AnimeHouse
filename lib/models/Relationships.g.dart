// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Relationships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationships _$RelationshipsFromJson(Map<String, dynamic> json) {
  return Relationships(
    streamingLinks: json['streamingLinks'] == null
        ? null
        : StreamingLinks.fromJson(
            json['streamingLinks'] as Map<String, dynamic>),
    episodes: json['episodes'] == null
        ? null
        : EpisodeLinks.fromJson(json['episodes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipsToJson(Relationships instance) =>
    <String, dynamic>{
      'streamingLinks': instance.streamingLinks,
      'episodes': instance.episodes,
    };
