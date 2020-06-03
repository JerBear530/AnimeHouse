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
  )..averageRating = json['averageRating'] as String;
}

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'slug': instance.slug,
      'canonicalTitle': instance.canonicalTitle,
      'titles': instance.titles,
      'posterImage': instance.posterImage,
      'coverImage': instance.coverImage,
    };
