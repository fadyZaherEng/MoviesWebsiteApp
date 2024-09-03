import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/presentation/screens/landing_app/landing_screen.dart';
import 'package:movies_website_apps/src/presentation/screens/splash/splash_screen.dart';

class Routes {

  static const String splash = "/";
  static const String landing = "/landing";
  //web
  static const String landingWeb = "/";
}

class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    print("Mobile routeSettings.name: ${routeSettings.name}");
    switch (routeSettings.name) {
      // case Routes.splash:
      // case Routes.deepLinking:
      //   return _materialRoute(const SplashScreen());
      case Routes.landing:
        return _materialRoute(const LandingScreen());
      case Routes.splash:
        return _materialRoute(const SplashScreen());
      default:
        return kIsWeb
            ? _materialRoute(const LandingScreen())
            : _materialRoute(const SplashScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: Center(
          child: Text(name),
        ),
      ),
    );
  }
}

final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();

// final GoRouter webRouter = GoRouter(
//   initialLocation: Routes.landingWeb,
//   debugLogDiagnostics: true,
//   navigatorKey: webNavigatorKey,
//   observers: [routeObserver],
//   routes: [
//     GoRoute(
//         path: Routes.landingWeb,
//         name: Routes.landingWeb,
//         builder: (context, state) => const LandingScreen()),
//     GoRoute(
//         path: Routes.webUnits,
//         name: Routes.webUnits,
//         builder: (context, state) => const UnitsWebScreen()),
//     GoRoute(
//         path: "${Routes.unitDetailsWebById}/:id",
//         builder: (context, state) => UnitDetailsWebScreen(
//             unitId: int.parse(state.pathParameters["id"] ?? "0"))),
//     GoRoute(
//         path: "${Routes.unitDetailsWeb}/:id",
//         builder: (context, state) => UnitDetailsWebScreen(
//             unitId: int.parse(state.pathParameters["id"] ?? "0"))),
//     GoRoute(
//         path: Routes.contactUs,
//         name: Routes.contactUs,
//         builder: (context, state) => const ContactUsScreen()),
//     GoRoute(
//         path: Routes.webContactUs,
//         name: Routes.webContactUs,
//         builder: (context, state) => const ContactUsScreen()),
//   ],
// );


