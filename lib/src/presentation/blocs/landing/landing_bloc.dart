import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_play_now_use_case.dart';

part 'landing_event.dart';

part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final GetPlayNowUseCase _getPlayNowUseCase;

  LandingBloc(
    this._getPlayNowUseCase,
  ) : super(LandingInitial()) {
    on<LandingPlayNowEvent>(_onLandingPlayNowEvent);
  }

  FutureOr<void> _onLandingPlayNowEvent(
      LandingPlayNowEvent event, Emitter<LandingState> emit) async {
    emit(LandingPlayNowLoading());
    DataState<List<Movie>> result =
        await _getPlayNowUseCase.getPlayNow(event.queryParametersRequest);
    if (result is DataSuccess) {
      emit(LandingPlayNowSuccess(movies: result.data ?? []));
    } else {
      emit(LandingPlayNowError(message: result.message ?? "Failed"));
    }
  }
}
