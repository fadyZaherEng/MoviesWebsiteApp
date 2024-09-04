import 'package:json_annotation/json_annotation.dart';

part 'tmdb_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TMDBResponse<T> {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'responseMessage')
  String? responseMessage;
  @JsonKey(name: 'dates')
  T? dates;
  @JsonKey(name: 'results')
  T? result;

  TMDBResponse({
    this.success,
    this.responseMessage,
    this.result,
    this.dates,
    this.page,
    this.totalPages,
    this.totalResults,
  });

  factory TMDBResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$TMDBResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$TMDBResponseToJson(this, (T) {
        return T;
      });
}
