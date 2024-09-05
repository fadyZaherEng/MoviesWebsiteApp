part of 'landing_bloc.dart';

@immutable
sealed class LandingState {}

final class LandingInitial extends LandingState {}

final class LandingPlayNowLoading extends LandingState {}
final class LandingPlayNowSuccess extends LandingState {
  final List<Movie> movies;

  LandingPlayNowSuccess({required this.movies});
}

final class LandingPlayNowError extends LandingState {
  final String message;
  LandingPlayNowError({required this.message});
}

//get top rated

final class LandingTopRatedLoading extends LandingState {}

final class LandingTopRatedSuccess extends LandingState {
  final List<Movie> movies;
  LandingTopRatedSuccess({required this.movies});
}

final class LandingTopRatedError extends LandingState {
  final String message;
  LandingTopRatedError({required this.message});
}
//get popular

final class LandingPopularLoading extends LandingState {}

final class LandingPopularSuccess extends LandingState {
  final List<Movie> movies;
  LandingPopularSuccess({required this.movies});
}

final class LandingPopularError extends LandingState {
  final String message;
  LandingPopularError({required this.message});
}
//upcoming

final class LandingUpcomingLoading extends LandingState {}

final class LandingUpcomingSuccess extends LandingState {
  final List<Movie> movies;
  LandingUpcomingSuccess({required this.movies});
}

final class LandingUpcomingError extends LandingState {
  final String message;
  LandingUpcomingError({required this.message});
}
//search movies

final class LandingSearchLoading extends LandingState {}

final class LandingSearchSuccess extends LandingState {
  final List<Movie> movies;
  LandingSearchSuccess({required this.movies});
}

final class LandingSearchError extends LandingState {
  final String message;
  LandingSearchError({required this.message});
}
//get similarById

final class LandingSimilarLoading extends LandingState {}

final class LandingSimilarSuccess extends LandingState {
  final List<Movie> movies;
  LandingSimilarSuccess({required this.movies});
}

final class LandingSimilarError extends LandingState {
  final String message;
  LandingSimilarError({required this.message});
}
//get movie details

final class LandingMovieDetailsLoading extends LandingState {}

final class LandingMovieDetailsSuccess extends LandingState {
  final Movie movie;
  LandingMovieDetailsSuccess({required this.movie});
}

final class LandingMovieDetailsError extends LandingState {
  final String message;
  LandingMovieDetailsError({required this.message});
}