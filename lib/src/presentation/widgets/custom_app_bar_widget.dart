import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/presentation/widgets/restart_widget.dart';
import "package:universal_html/html.dart" as html;

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  bool isDrawerOpen;
  final void Function() onDrawerPressed;
  final void Function(String) onSearchPressed;
  final TextEditingController searchTextController;

  CustomAppBarWidget({
    super.key,
    this.isDrawerOpen = false,
    required this.onDrawerPressed,
    required this.onSearchPressed,
    required this.searchTextController,
  });

  @override
  State<CustomAppBarWidget> createState() => _State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _State extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isDrawerOpen
          ? null
          : Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: ColorSchemes.white,
                  ),
                  onPressed: () {
                    widget.isDrawerOpen = true;
                    // widget.onDrawerPressed();
                    setState(() {});
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                if (kIsWeb) {
                  // context.go(Routes.landingWeb);
                  html.window.location.reload();
                } else {
                  // Navigator.popUntil(context, (route) => true);
                  RestartWidget.restartApp(context);
                }
              },
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
            const SizedBox(width: 15),
            Container(
              //how to add number in routing from city eye
              width: MediaQuery.of(context).size.width * 0.55,
              height: 40,
              decoration: BoxDecoration(
                color: ColorSchemes.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ColorSchemes.white),
              ),
              child: Center(
                child: TextField(
                  controller: widget.searchTextController,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: ColorSchemes.black,
                      ),
                  onSubmitted: (String value) {
                    context.go('/search/$value');
                  },
                  onChanged: (String value) {
                    widget.onSearchPressed(value);
                  },
                  decoration: InputDecoration(
                    fillColor: ColorSchemes.white,
                    focusColor: ColorSchemes.white,
                    hoverColor: ColorSchemes.white,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                          Icon(Icons.clear, color: ColorSchemes.gray, size: 15),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        // context.go('/search/');
                        widget.searchTextController.text = "";
                        widget
                            .onSearchPressed(widget.searchTextController.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: ColorSchemes.gray.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: ColorSchemes.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    hintText: "Search...",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
