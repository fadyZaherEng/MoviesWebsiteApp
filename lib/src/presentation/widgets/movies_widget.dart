import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/presentation/screens/movie/movie_screen.dart';
import 'package:skeletons/skeletons.dart';

class MoviesWidget extends StatefulWidget {
  final bool isLoading;
  final List<Movie> movies;
  final void Function(int) onMovieTap;
  final bool isMoviesScreen;

  const MoviesWidget({
    super.key,
    required this.isLoading,
    required this.movies,
    required this.onMovieTap,
    this.isMoviesScreen = false,
  });

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  int? _hoverIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: const Responsive().isMobile(context)
            ? 2
            : const Responsive().isTablet(context)
                ? 4
                : 5, // Number of columns
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
        childAspectRatio: const Responsive().isMobile(context)
            ? 0.9
            : 0.8, // Aspect ratio of the grid items
      ),
      itemCount: widget.isLoading ? 12 : widget.movies.length,
      itemBuilder: (context, index) {
        return widget.isLoading
            ? SkeletonItem(
                child: Card(
                    elevation: 0,
                    color: Colors.black12,
                    child: Container(
                      color: Colors.black12,
                    )))
            : MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hoverIndex = index;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hoverIndex = null;
                  });
                },
                onHover: (_) {
                  setState(() {
                    _hoverIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: _hoverIndex == index
                      ? (Matrix4.identity()
                        ..scale(1.05, 1.05)
                        ..translate(0, -10))
                      : Matrix4.identity(),
                  child: GestureDetector(
                    onTap: () {
                      // widget.onMovieTap(index);
                      if (widget.isMoviesScreen) {
                        if (kIsWeb) {
                          widget.onMovieTap(index);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieScreen(
                                      movieId: widget.movies[index].id)));
                        }
                      } else {
                        if (kIsWeb) {
                          context.go(Routes.movies);
                        } else {
                          Navigator.of(context).pushNamed(Routes.movies);
                        }
                      }
                    },
                    child: Card(
                      elevation: _hoverIndex == index ? 20 : 4,
                      color: Colors.black12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${Constants.imageBaseUrl}${widget.movies[index].backdropPath}',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorWidget: (context, error, stackTrace) =>
                                    const Icon(Icons.error, size: 100),
                                matchTextDirection: true,
                                placeholder: (context, _) {
                                  return const SkeletonLine(
                                    style: SkeletonLineStyle(
                                      width: double.infinity,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(widget.movies[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFE2B216),
                                    ),
                                    Text(
                                        widget.movies[index].voteAverage
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                            ))
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Language: ${widget.movies[index].originalLanguage}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Adult: ${widget.movies[index].adult ? 'Yes' : 'No'}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class Responsive {
  const Responsive();

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1100;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
