import 'package:json_annotation/json_annotation.dart';

part 'query_paramters_request.g.dart';

@JsonSerializable()
class QueryParametersRequest {
  // for this parameters:
  // include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}'
  @JsonKey(name: 'include_adult')
  bool? includeAdult;
  @JsonKey(name: 'include_video')
  bool? includeVideo;
  @JsonKey(name: 'language')
  String language;
  @JsonKey(name: 'page')
  int page;
  @JsonKey(name: 'sort_by')
  String? sortBy;
  @JsonKey(name: 'with_release_type')
  String? withReleaseType;
  @JsonKey(name: 'release_date.gte')
  String? releaseDateGte;
  @JsonKey(name: 'release_date.lte')
  String? releaseDateLte;
  @JsonKey(name: "query")
  String? query;

  QueryParametersRequest({
    this.includeAdult ,
    this.includeVideo ,
    required this.language,
    required this.page,
    this.sortBy ,
    this.withReleaseType ,
    this.releaseDateGte ,
    this.releaseDateLte ,
    this.query
  });

  factory QueryParametersRequest.fromJson(Map<String, dynamic> json) =>
      _$QueryParametersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParametersRequestToJson(this);
}
