import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:skeletons/skeletons.dart';

class PopularMoviesWidget extends StatefulWidget {
  final bool isLoading;
  final List<Movie> popularMovies;

  const PopularMoviesWidget({
    super.key,
    required this.isLoading,
    required this.popularMovies,
  });

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  int? _hoverIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: const Responsive().isMobile(context)
            ? 2 : const Responsive().isTablet(context) ? 3 : 5,
        childAspectRatio: const Responsive().isMobile(context) ? 0.5 : 0.8,
      ),
      itemCount: widget.isLoading ? 12 : widget.popularMovies.length,
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: _hoverIndex == index
                    ? (Matrix4.identity()
                      ..scale(1.05, 1.05)
                      ..translate(0, -10))
                    : Matrix4.identity(),
                child: GestureDetector(
                  onTap: () {
                    context.go(
                      '${Routes.movies}/${widget.popularMovies[index].id}',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
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
                              child: Image.network(
                                '${Constants.imageBaseUrl}${widget.popularMovies[index].backdropPath}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                                matchTextDirection: true,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(12),
                              children: [
                                Text(
                                  widget.popularMovies[index].title,
                                  style:
                                      Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFE2B216),
                                    ),
                                    Text(
                                      widget
                                          .popularMovies[index].voteAverage
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Language: ${widget.popularMovies[index].originalLanguage}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Adult: ${widget.popularMovies[index].adult ? 'Yes' : 'No'}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
