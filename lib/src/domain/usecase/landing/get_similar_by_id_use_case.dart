import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/domain/repositories/landing/landing_repository.dart';

class GetSimilarByIdUseCase {
  final LandingRepository landingRepository;

  GetSimilarByIdUseCase({
    required this.landingRepository,
  });

  Future<DataState<List<Movie>>> getSimilarById(
      QueryParametersRequest queryParametersRequest, int movieId) async {
    return await landingRepository.getSimilarById(queryParametersRequest,  movieId);
  }
}
