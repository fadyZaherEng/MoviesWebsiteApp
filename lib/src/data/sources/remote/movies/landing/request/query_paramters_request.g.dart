// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_paramters_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParametersRequest _$QueryParametersRequestFromJson(
        Map<String, dynamic> json) =>
    QueryParametersRequest(
      includeAdult: json['include_adult'] as bool,
      includeVideo: json['include_video'] as bool,
      language: json['language'] as String,
      page: (json['page'] as num).toInt(),
      sortBy: json['sort_by'] as String,
      withReleaseType: json['with_release_type'] as String,
      releaseDateGte: json['release_date.gte'] as String,
      releaseDateLte: json['release_date.lte'] as String,
    );

Map<String, dynamic> _$QueryParametersRequestToJson(
        QueryParametersRequest instance) =>
    <String, dynamic>{
      'include_adult': instance.includeAdult,
      'include_video': instance.includeVideo,
      'language': instance.language,
      'page': instance.page,
      'sort_by': instance.sortBy,
      'with_release_type': instance.withReleaseType,
      'release_date.gte': instance.releaseDateGte,
      'release_date.lte': instance.releaseDateLte,
    };
