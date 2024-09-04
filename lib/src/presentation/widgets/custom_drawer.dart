import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/generated/l10n.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/landing_screen.dart';
import 'package:movies_website_apps/src/presentation/screens/movies/movies_screen.dart';

class CustomDrawer extends StatelessWidget {
  final void Function() onTap;

  const CustomDrawer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFFE2B616),
                  ),
                  onPressed: () {
                    onTap();
                    Scaffold.of(context).closeDrawer();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //   icon: const Icon(
              //     Icons.menu,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {
              //     onTap();
              //     Scaffold.of(context).closeDrawer();
              //   },
              // ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.landingWeb);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingScreen()));
                      onTap();
                      Scaffold.of(context).closeDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        S.of(context).home,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xFFE2B616)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.movies);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MoviesScreen()));
                      onTap();
                      Scaffold.of(context).closeDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        S.of(context).movies,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xFFE2B616)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
