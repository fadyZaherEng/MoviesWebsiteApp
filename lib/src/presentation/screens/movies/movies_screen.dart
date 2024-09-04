import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_app_bar_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_drawer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text("Movies Screen"),
      ),
    );
  }
}
