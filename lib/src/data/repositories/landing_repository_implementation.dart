import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movies_website_apps/src/core/resources/data_state.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/entity/remote_movies.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/landing_api_services.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/tmdb_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/domain/repositories/landing/landing_repository.dart';

class LandingRepositoryImplementation implements LandingRepository {
  final LandingApiServices _landingApiServices;

  LandingRepositoryImplementation(this._landingApiServices);

  @override
  Future<DataState<List<Movie>>> getPlayNow(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse =
          await _landingApiServices.getPlayNow(request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }

  @override
  Future<DataState<List<Movie>>> getTopRated(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse = await _landingApiServices.getTopRated(
          request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }

  @override
  Future<DataState<List<Movie>>> getPopular(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse =
          await _landingApiServices.getPopular(request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }

  @override
  Future<DataState<List<Movie>>> getUpcoming(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse = await _landingApiServices.getUpcoming(
          request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }

  @override
  Future<DataState<List<Movie>>> searchMovies(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse = await _landingApiServices.searchMovies(
          request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }

  @override
  Future<DataState<Movie>> getMovieDetailsById(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse = await _landingApiServices.getMovieDetailsById(
          request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data:
              (httpResponse.data.result ?? const RemoteMovies()).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
    }
  }

  @override
  Future<DataState<List<Movie>>> getSimilarById(
      QueryParametersRequest queryParametersRequest) async {
    try {
      TMDBRequest request = await TMDBRequest().createRequest(null);
      final httpResponse = await _landingApiServices.getSimilarById(
          request, queryParametersRequest);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "Failed",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "bad Response",
      );
      }
  }
}
