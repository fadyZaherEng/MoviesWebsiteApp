import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';

abstract class LandingRepository {
  Future<DataState<List<Movie>>> getPlayNow(
      QueryParametersRequest queryParametersRequest);
}
