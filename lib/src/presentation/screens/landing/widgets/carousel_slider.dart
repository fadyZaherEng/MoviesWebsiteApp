import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:skeletons/skeletons.dart';
class CarouselSliderWidget extends StatelessWidget {
  final bool isLoading;
  final List<Movie> topRatedMovies;
  final void Function(int) onSliderTap;

  const CarouselSliderWidget({
    super.key,
    required this.isLoading,
    required this.topRatedMovies,
    required this.onSliderTap,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: isLoading
          ? List.generate(
              5,
              (index) {
                return SkeletonItem(
                  child: Builder(
                    builder: (BuildContext context) {
                      return Container(
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))));
                    },
                  ),
                );
              },
            )
          : topRatedMovies.isEmpty
              ? [
                  SkeletonItem(
                    child: Builder(
                      builder: (BuildContext context) {
                        return Container(
                            decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))));
                      },
                    ),
                  )
                ]
              : topRatedMovies
                  .map(
                    (Movie movie) => Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap:(){
                            onSliderTap(movie.id);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "${Constants.imageBaseUrl}${movie.posterPath}" ,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
      options: CarouselOptions(
        height: 500,
        autoPlay: true,
        aspectRatio: 2,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: true,
        pageSnapping: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        scrollPhysics: const BouncingScrollPhysics(),
        disableCenter: true,
      ),
    );
  }
}
