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