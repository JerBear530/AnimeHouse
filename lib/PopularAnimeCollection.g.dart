// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PopularAnimeCollection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularAnimeCollection _$PopularAnimeCollectionFromJson(
    Map<String, dynamic> json) {
  return PopularAnimeCollection(
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularAnimeCollectionToJson(
        PopularAnimeCollection instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
