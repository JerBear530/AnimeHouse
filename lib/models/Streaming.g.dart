// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Streaming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Streaming _$StreamingFromJson(Map<String, dynamic> json) {
  return Streaming(
    id: json['id'] as String,
    type: json['type'] as String,
    attributes: json['attributes'] == null
        ? null
        : StreamingAttributes.fromJson(
            json['attributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreamingToJson(Streaming instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };
