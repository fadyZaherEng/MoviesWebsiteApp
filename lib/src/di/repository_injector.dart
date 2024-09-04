import 'package:movies_website_apps/src/data/repositories/landing_repository_implementation.dart';
import 'package:movies_website_apps/src/di/data_layer_injector.dart';
import 'package:movies_website_apps/src/domain/repositories/landing/landing_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<LandingRepository>(
      () => LandingRepositoryImplementation(injector()));
}
