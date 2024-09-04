import 'package:movies_website_apps/src/di/data_layer_injector.dart';
import 'package:movies_website_apps/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:movies_website_apps/src/presentation/blocs/main/main_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<MainCubit>(() => MainCubit(
        injector(),
        injector(),
      ));
  injector.registerFactory<LandingBloc>(() => LandingBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
}
