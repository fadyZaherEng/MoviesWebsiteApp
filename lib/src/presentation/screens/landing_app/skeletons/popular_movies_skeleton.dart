import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class PopularMoviesSkeleton extends StatelessWidget {
  const PopularMoviesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: Colors.black12,
            child: Container(
              color:  Colors.black12,
            ),
          );
        },
      ),
    );
  }
}
