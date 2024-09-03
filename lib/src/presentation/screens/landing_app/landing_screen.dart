import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/core/base/widget/base_stateful_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/carousel_skeleton.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_app_bar_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_drawer.dart';
import 'package:movies_website_apps/src/presentation/widgets/now_playing_skelton.dart';

class LandingScreen extends BaseStatefulWidget {
  const LandingScreen({super.key});

  @override
  BaseState<LandingScreen> baseCreateState() => _LandingWebScreenState();
}

class _LandingWebScreenState extends BaseState<LandingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  @override
  Widget baseBuild(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(
            onTap: () {
              _isDrawerOpen = false;
              setState(() {});
            },
          ),
          appBar: CustomAppBarWidget(
            isDrawerOpen: _isDrawerOpen,
            onDrawerPressed: () {
              _isDrawerOpen = false;
              setState(() {});
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Top Rated Movies",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorSchemes.white,
                    )
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CarouselSkeleton(),
                      ),
                      Expanded(
                        flex: 1,
                        child: NowPlayingSkeleton(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
