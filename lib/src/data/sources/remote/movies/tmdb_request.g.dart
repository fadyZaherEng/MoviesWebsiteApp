// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBRequest<T> _$TMDBRequestFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TMDBRequest<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      userId: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TMDBRequestToJson<T>(
  TMDBRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
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
