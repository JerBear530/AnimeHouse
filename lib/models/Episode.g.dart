// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return Episode(
    id: json['id'] as String,
    type: json['type'] as String,
    attributes: json['attributes'] == null
        ? null
        : EpisodeAttributes.fromJson(
            json['attributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };
