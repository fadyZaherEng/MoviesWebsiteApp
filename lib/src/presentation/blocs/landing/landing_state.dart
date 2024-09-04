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
