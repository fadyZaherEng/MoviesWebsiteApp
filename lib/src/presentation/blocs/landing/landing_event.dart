part of 'landing_bloc.dart';

@immutable
sealed class LandingEvent {}

class LandingPlayNowEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;

  LandingPlayNowEvent({
    required this.queryParametersRequest,
  });
}

class LandingTopRatedEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;

  LandingTopRatedEvent({
    required this.queryParametersRequest,
  });
}

class LandingPopularEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;

  LandingPopularEvent({
    required this.queryParametersRequest,
  });
}
class LandingUpcomingEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;

  LandingUpcomingEvent({
    required this.queryParametersRequest,
  });
}
class LandingSearchEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;

  LandingSearchEvent({
    required this.queryParametersRequest,
  });
}

class LandingGetSimilarByIdEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;
  final  int movieId;

  LandingGetSimilarByIdEvent({
    required this.queryParametersRequest,
    required this.movieId,
  });
}

class LandingGetMovieByIdEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;
  final  int movieId;

  LandingGetMovieByIdEvent({
    required this.queryParametersRequest,
    required this.movieId,
  });
}