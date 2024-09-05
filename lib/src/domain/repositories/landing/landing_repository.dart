import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';

abstract class LandingRepository {
  Future<DataState<List<Movie>>> getPlayNow(
      QueryParametersRequest queryParametersRequest);

  Future<DataState<List<Movie>>> getTopRated(
      QueryParametersRequest queryParametersRequest);

  Future<DataState<List<Movie>>> getPopular(
      QueryParametersRequest queryParametersRequest);

  Future<DataState<List<Movie>>> getUpcoming(
      QueryParametersRequest queryParametersRequest);

  Future<DataState<List<Movie>>> searchMovies(
      QueryParametersRequest queryParametersRequest);

  Future<DataState<Movie>> getMovieDetailsById(
      QueryParametersRequest queryParametersRequest, int movieId);

  Future<DataState<List<Movie>>> getSimilarById(
      QueryParametersRequest queryParametersRequest, int movieId);
}
