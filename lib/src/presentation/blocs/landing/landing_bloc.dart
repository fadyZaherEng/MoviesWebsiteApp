import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_play_now_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_pupolar_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_top_rated_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_up_coming_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/search_movies_use_case.dart';

part 'landing_event.dart';

part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final GetPlayNowUseCase _getPlayNowUseCase;
  final GetTopRatedUseCase _getTopRatedMoviesUseCase;
  final GetPopularUseCase _getPopularMoviesUseCase;
  final GetUpComingUseCase _getUpcomingMoviesUseCase;
  final SearchMoviesUseCase _searchMoviesUseCase;

  LandingBloc(
    this._getPlayNowUseCase,
    this._getTopRatedMoviesUseCase,
    this._getPopularMoviesUseCase,
    this._getUpcomingMoviesUseCase,
    this._searchMoviesUseCase,
  ) : super(LandingInitial()) {
    on<LandingPlayNowEvent>(_onLandingPlayNowEvent);
    on<LandingTopRatedEvent>(_onLandingTopRatedEvent);
    on<LandingPopularEvent>(_onLandingPopularEvent);
    on<LandingUpcomingEvent>(_onLandingUpcomingEvent);
    on<LandingSearchEvent>(_onLandingSearchEvent);
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

  FutureOr<void> _onLandingTopRatedEvent(
      LandingTopRatedEvent event, Emitter<LandingState> emit) async {
    emit(LandingTopRatedLoading());
    DataState<List<Movie>> result = await _getTopRatedMoviesUseCase
        .getTopRated(event.queryParametersRequest);
    if (result is DataSuccess) {
      emit(LandingTopRatedSuccess(movies: result.data ?? []));
    } else {
      emit(LandingTopRatedError(message: result.message ?? "Failed"));
    }
  }

  FutureOr<void> _onLandingPopularEvent(
      LandingPopularEvent event, Emitter<LandingState> emit) async {
    emit(LandingPopularLoading());
    DataState<List<Movie>> result =
        await _getPopularMoviesUseCase.getPopular(event.queryParametersRequest);
    if (result is DataSuccess) {
      emit(LandingPopularSuccess(movies: result.data ?? []));
    } else {
      emit(LandingPopularError(message: result.message ?? "Failed"));
    }
  }

  FutureOr<void> _onLandingUpcomingEvent(
      LandingUpcomingEvent event, Emitter<LandingState> emit) async {
    emit(LandingUpcomingLoading());
    DataState<List<Movie>> result = await _getUpcomingMoviesUseCase
        .getUpComing(event.queryParametersRequest);
    if (result is DataSuccess) {
      emit(LandingUpcomingSuccess(movies: result.data ?? []));
    } else {
      emit(LandingUpcomingError(message: result.message ?? "Failed"));
    }
  }

  FutureOr<void> _onLandingSearchEvent(
      LandingSearchEvent event, Emitter<LandingState> emit) async {
    emit(LandingSearchLoading());
    DataState<List<Movie>> result =
        await _searchMoviesUseCase.searchMovies(event.queryParametersRequest);
    if (result is DataSuccess) {
      emit(LandingSearchSuccess(movies: result.data ?? []));
    } else {
      emit(LandingSearchError(message: result.message ?? "Failed"));
    }
  }
}
