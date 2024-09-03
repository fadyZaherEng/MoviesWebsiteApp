import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isDrawerOpen;
  final void Function() onDrawerPressed;

  const CustomAppBarWidget({
    super.key,
    required this.isDrawerOpen,
    required this.onDrawerPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isDrawerOpen
          ? null
          : Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: ColorSchemes.primary,
                  ),
                  onPressed: () {
                    onDrawerPressed();
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFE2B616),
              ),
              child: const Text(
                "TMDB",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              //how to add number in routing from city eye
              width: MediaQuery.of(context).size.width * 0.55,
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                  onSubmitted: (String value) {
                    context.go('/search/$value');
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.clear),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.go('/search/');
                        },
                        icon: const Icon(Icons.cancel),
                      ),
                      hintText: "Search...",
                      border: InputBorder.none),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
