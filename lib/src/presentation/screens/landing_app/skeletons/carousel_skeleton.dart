import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeletons/skeletons.dart';

class CarouselSkeleton extends StatelessWidget {
  const CarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: CarouselSlider(
        items: List.generate(
          5, (index) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  color: Colors.black54,
                );
              },
            );
          },
        ),
        options: CarouselOptions(
          height: 500,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enableInfiniteScroll: true,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}
