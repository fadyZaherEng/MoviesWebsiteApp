part of 'landing_bloc.dart';

@immutable
sealed class LandingEvent {}

class LandingPlayNowEvent extends LandingEvent {
  final QueryParametersRequest queryParametersRequest;

  LandingPlayNowEvent({
    required this.queryParametersRequest,
  });
}
