// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesList _$MoviesListFromJson(Map<String, dynamic> json) => MoviesList(
      page: json['page'] as int?,
      total_pages: json['total_pages'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesListToJson(MoviesList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.total_pages,
      'results': instance.results,
    };
