import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NowPlayingSkeleton extends StatelessWidget {
  const NowPlayingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.black54,
              width: 80,
              height: 120,
            ),
            title: Container(
              color: Colors.black54,
              height: 20,
            ),
            subtitle: Container(
              color: Colors.black54,
              height: 40,
            ),
          );
        },
      ),
    );
  }
}
