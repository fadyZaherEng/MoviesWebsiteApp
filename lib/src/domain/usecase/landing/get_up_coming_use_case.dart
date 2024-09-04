import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/domain/repositories/landing/landing_repository.dart';

class GetUpComingUseCase {
  final LandingRepository landingRepository;

  GetUpComingUseCase({
    required this.landingRepository,
  });

  Future<DataState<List<Movie>>> getTopRated(
      QueryParametersRequest queryParametersRequest) async {
    return await landingRepository.getTopRated(queryParametersRequest);
  }
}
