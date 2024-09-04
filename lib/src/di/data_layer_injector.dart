import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/data/sources/remote/api_key.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/landing_api_services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDataDependencies() async {
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = APIKeys.baseUrl
    ..options.headers = {
      "Authorization": "Bearer ${Constants.token}",
      "accept": "application/json",
    }
    ..interceptors.add(ChuckerDioInterceptor())
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  injector.registerSingleton<LandingApiServices>(LandingApiServices(injector()),
  );
}
