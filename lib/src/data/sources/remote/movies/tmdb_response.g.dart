// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBResponse<T> _$TMDBResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TMDBResponse<T>(
      success: json['success'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      result: _$nullableGenericFromJson(json['results'], fromJsonT),
      dates: _$nullableGenericFromJson(json['dates'], fromJsonT),
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TMDBResponseToJson<T>(
  TMDBResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'success': instance.success,
      'responseMessage': instance.responseMessage,
      'dates': _$nullableGenericToJson(instance.dates, toJsonT),
      'results': _$nullableGenericToJson(instance.result, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
