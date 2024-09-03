import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/core/base/widget/base_stateful_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_app_bar_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_drawer.dart';

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
              _isDrawerOpen = !_isDrawerOpen;
              setState(() {});
            },
          ),
          body: const Center(
            child: Text("Landing Screen"),
          ),
        );
      },
    );
  }
}
