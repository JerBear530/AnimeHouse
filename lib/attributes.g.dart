// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return Attributes(
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    slug: json['slug'] as String,
    titles: json['titles'] == null
        ? null
        : Titles.fromJson(json['titles'] as Map<String, dynamic>),
    posterImage: json['posterImage'] == null
        ? null
        : PosterImage.fromJson(json['posterImage'] as Map<String, dynamic>),
    coverImage: json['coverImage'] == null
        ? null
        : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
    canonicalTitle: json['canonicalTitle'] as String,
    averageRating: json['averageRating'] as String,
    ageRating: json['ageRating'] as String,
    endDate: json['endDate'] as String,
    episodeCount: json['episodeCount'] as int,
    episodeLength: json['episodeLength'] as int,
    favoritesCount: json['favoritesCount'] as int,
    popularityRank: json['popularityRank'] as int,
    showType: json['showType'] as String,
    startDate: json['startDate'] as String,
    status: json['status'] as String,
    youtubeVideoId: json['youtubeVideoId'] as String,
  );
}

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      'canonicalTitle': instance.canonicalTitle,
      'episodeLength': instance.episodeLength,
      'favoritesCount': instance.favoritesCount,
      'popularityRank': instance.popularityRank,
      'ageRating': instance.ageRating,
      'status': instance.status,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'youtubeVideoId': instance.youtubeVideoId,
      'showType': instance.showType,
      'episodeCount': instance.episodeCount,
      'titles': instance.titles,
      'posterImage': instance.posterImage,
      'coverImage': instance.coverImage,
    };
