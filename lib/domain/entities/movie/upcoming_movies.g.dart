// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpComingMovies _$UpComingMoviesFromJson(Map<String, dynamic> json) =>
    UpComingMovies(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpComingMoviesToJson(UpComingMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
