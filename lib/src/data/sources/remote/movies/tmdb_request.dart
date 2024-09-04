import 'package:json_annotation/json_annotation.dart';

part 'tmdb_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TMDBRequest<T> {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'data')
  T? data;

  TMDBRequest({
    this.data,
    this.userId,
  });

  factory TMDBRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$TMDBRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$TMDBRequestToJson(this, (T) {
        return T;
      });

  TMDBRequest<T> createRequest(T) {
    return TMDBRequest(
      userId:  0,
      data: T,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'data': data != null ? data : null,
    };
  }

  factory TMDBRequest.fromMap(Map<String, dynamic> map) {
    return TMDBRequest(
      userId: map['userId'] as int,
      data: map['data'] as T,
    );
  }

  TMDBRequest<T> copyWith({
    int? userId,
  }) {
    return TMDBRequest(
      userId: userId,
      data: data,
    );
  }
}
