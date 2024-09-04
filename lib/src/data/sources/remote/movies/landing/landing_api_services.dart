import 'package:dio/dio.dart';
import 'package:movies_website_apps/src/data/sources/remote/api_key.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/entity/remote_movies.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/tmdb_request.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/tmdb_response.dart';
import 'package:retrofit/retrofit.dart';

part 'landing_api_services.g.dart';

@RestApi()
abstract class LandingApiServices {
  factory LandingApiServices(Dio dio) = _LandingApiServices;

  @GET(APIKeys.playNow)
  Future<HttpResponse<TMDBResponse<List<RemoteMovies>>>> getPlayNow(
    @Body() TMDBRequest request,
    @Queries() QueryParametersRequest queryParametersRequest,
  );
}
