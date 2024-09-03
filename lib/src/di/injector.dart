
import 'package:movies_website_apps/src/di/bloc_injector.dart';
import 'package:movies_website_apps/src/di/data_layer_injector.dart';
import 'package:movies_website_apps/src/di/repository_injector.dart';
import 'package:movies_website_apps/src/di/use_case_injector.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeDataDependencies();
  await initializeRepositoryDependencies();
  await initializeUseCaseDependencies();
  await initializeBlocDependencies();
}
