// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SingleAnimeCollection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleAnimeCollection _$SingleAnimeCollectionFromJson(
    Map<String, dynamic> json) {
  return SingleAnimeCollection(
    data: json['data'] == null
        ? null
        : Anime.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleAnimeCollectionToJson(
        SingleAnimeCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
