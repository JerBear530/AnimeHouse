// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataStreaming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamingData _$StreamingDataFromJson(Map<String, dynamic> json) {
  return StreamingData(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Streaming.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StreamingDataToJson(StreamingData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
