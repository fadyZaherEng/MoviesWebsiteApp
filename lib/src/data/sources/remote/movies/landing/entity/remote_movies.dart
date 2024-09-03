import 'package:json_annotation/json_annotation.dart';
import 'package:movies_website_apps/src/domain/entities/landing/remote_movies.dart';

part 'remote_movies.g.dart';

@JsonSerializable()
class RemoteMovies {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  const RemoteMovies({
    this.adult = false,
    this.backdropPath = "",
    this.genreIds = const [],
    this.id = 0,
    this.originalLanguage = "",
    this.originalTitle = "",
    this.overview = "",
    this.popularity = 0.0,
    this.posterPath = "",
    this.releaseDate = "",
    this.title = "",
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  factory RemoteMovies.fromJson(Map<String, dynamic> json) =>
      _$RemoteMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMoviesToJson(this);
}

extension RemoteMoviesExtension on RemoteMovies {
  Movies mapToDomain() {
    return Movies(
        adult: adult ?? false,
        backdropPath: backdropPath ?? "",
        genreIds: genreIds ?? [],
        id: id ?? 0,
        originalLanguage: originalLanguage ?? "",
        originalTitle: originalTitle ?? "",
        overview: overview ?? "",
        popularity: popularity ?? 0.0,
        posterPath: posterPath ?? "",
        releaseDate: releaseDate ?? "",
        title: title ?? "",
        video: video ?? false,
        voteAverage: voteAverage ?? 0.0,
        voteCount: voteCount ?? 0);
  }
}

extension RemoteMoviesListExtension on List<RemoteMovies> {
  List<Movies> mapToDomain() {
    return map((e) => e.mapToDomain()).toList();
  }
}
