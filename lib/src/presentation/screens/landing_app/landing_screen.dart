import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/core/base/widget/base_stateful_widget.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      // scaffoldKey.currentState?.openDrawer();
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(onTap: () {
            // Scaffold.of(context).closeDrawer();
            _isDrawerOpen =false;
            setState(() {});
          }),
          // drawerScrimColor: ColorSchemes.primary,
          appBar: AppBar(
            leading: _isDrawerOpen
                ? null
                : Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.purpleAccent,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                          _isDrawerOpen = !_isDrawerOpen;
                          setState(() {});
                        },
                      );
                    },
                  ),
          ),
          body: const Center(
            child: Text("Landing Screen"),
          ),
        );
      },
    );
  }
}
