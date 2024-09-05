import 'package:movies_website_apps/src/di/data_layer_injector.dart';
import 'package:movies_website_apps/src/domain/usecase/get_language_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_movie_by_id_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_play_now_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_pupolar_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_similar_by_id_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_top_rated_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/get_up_coming_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/landing/search_movies_use_case.dart';
import 'package:movies_website_apps/src/domain/usecase/set_language_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<SetLanguageUseCase>(
      () => SetLanguageUseCase(injector()));

  injector.registerFactory<GetLanguageUseCase>(
      () => GetLanguageUseCase(injector()));

  injector.registerFactory<GetPlayNowUseCase>(
      () => GetPlayNowUseCase(landingRepository: injector()));

  injector.registerFactory<GetTopRatedUseCase>(
      () => GetTopRatedUseCase(landingRepository: injector()));

  injector.registerFactory<GetPopularUseCase>(
      () => GetPopularUseCase(landingRepository: injector()));

  injector.registerFactory<GetUpComingUseCase>(
      () => GetUpComingUseCase(landingRepository: injector()));

  injector.registerFactory<SearchMoviesUseCase>(
      () => SearchMoviesUseCase(landingRepository: injector()));

  injector.registerFactory<GetSimilarByIdUseCase>(
      () => GetSimilarByIdUseCase(landingRepository: injector()));

  injector.registerFactory<GetMovieByIdUseCase>(
      () => GetMovieByIdUseCase(landingRepository: injector()));
}
