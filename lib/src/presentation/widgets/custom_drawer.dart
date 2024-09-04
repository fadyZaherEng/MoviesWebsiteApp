import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/generated/l10n.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';

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
                  icon:  Icon(
                    Icons.close,
                    color: ColorSchemes.primary,
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
                            ?.copyWith(color: ColorSchemes.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.movies);
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
                            ?.copyWith(color: ColorSchemes.white),
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
