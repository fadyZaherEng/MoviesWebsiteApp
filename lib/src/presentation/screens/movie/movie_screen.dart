import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/widgets/footer.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_app_bar_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_drawer.dart';
import 'package:movies_website_apps/src/presentation/widgets/movies_widget.dart';
import 'package:skeletons/skeletons.dart';

class MovieScreen extends StatefulWidget {
  final int movieId;

  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
} //remote model for movie

class _MovieScreenState extends State<MovieScreen> {
  bool _isDrawerOpen = false;
  List<Movie> _similarMovies = [];
  Movie _currentMovie = const Movie();
  final TextEditingController searchTextController = TextEditingController();

  LandingBloc get _bloc => BlocProvider.of<LandingBloc>(context);
  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  void didUpdateWidget(covariant MovieScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movieId != widget.movieId) {
      init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(listener: (context, state) {
      if (state is LandingSimilarSuccess) {
        _similarMovies = state.movies;
      } else if (state is LandingMovieDetailsSuccess) {
        _currentMovie = state.movie;
      } else if (state is LandingMovieDetailsError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
        ));
      } else if (state is LandingSimilarError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
        ));
      } else if (state is LandingSearchError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      } else if (state is LandingSearchSuccess) {
        _similarMovies = state.movies;
      }
    }, builder: (context, state) {
      return Scaffold(
        drawer: CustomDrawer(
          currentPage: Routes.movie,
          onTap: () {
            _isDrawerOpen = false;
            setState(() {});
          },
        ),
        appBar: CustomAppBarWidget(
          isDrawerOpen: _isDrawerOpen,
          searchTextController: searchTextController,
          onDrawerPressed: () {
            _isDrawerOpen = false;
            setState(() {});
          },
          onSearchPressed: (String query) {
            _bloc.add(
              LandingSearchEvent(
                queryParametersRequest: QueryParametersRequest(
                  language: "en",
                  page: 1,
                  query: query,
                ),
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 700,
                width: double.infinity,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              '${Constants.originalImageBaseUrl}${_currentMovie.backdropPath}',
                          width: double.infinity,
                          height: 600,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) =>
                              const SkeletonLine(
                            style: SkeletonLineStyle(
                              width: double.infinity,
                              height: 600,
                            ),
                          ),
                          matchTextDirection: true,
                          placeholder: (context, _) {
                            return const SkeletonLine(
                              style: SkeletonLineStyle(
                                width: double.infinity,
                                height: 600,
                              ),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 600,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: AlignmentDirectional.topCenter,
                            end: AlignmentDirectional.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          )),
                        )
                      ],
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 0,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        '${Constants.imageBaseUrl}${_currentMovie.posterPath}',
                                    width: 150,
                                    height: 230,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, error, stackTrace) =>
                                        const SkeletonLine(
                                            style: SkeletonLineStyle(
                                          width: 150,
                                          height: 230,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        )),
                                    matchTextDirection: true,
                                    placeholder: (context, _) {
                                      return const SkeletonLine(
                                          style: SkeletonLineStyle(
                                        width: 150,
                                        height: 230,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ));
                                    }),
                              ),
                              Container(
                                width: 150,
                                height: 230,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    gradient: LinearGradient(
                                      begin: AlignmentDirectional.topCenter,
                                      end: AlignmentDirectional.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black,
                                      ],
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _currentMovie.originalTitle,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _currentMovie.releaseDate,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Popularity: ${_currentMovie.popularity.toString()}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _currentMovie.overview,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    'Original Language: ${_currentMovie.originalLanguage}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Similar Movies',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double gridHeight = state is LandingPopularLoading
                        ? (constraints.maxWidth / 5) * 1.25 * 3
                        : (constraints.maxWidth / 5) *
                        1.25 *
                        (_similarMovies.length / 5);
                    return SizedBox(
                      height: gridHeight,
                      child: MoviesWidget(
                        isLoading: state is LandingPopularLoading,
                        movies: _similarMovies,
                        onMovieTap: (int movieId) {
                          context.go("${Routes.movie}/$movieId");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieScreen(movieId: movieId)),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const FooterWidget(),
            ],
          ),
        ),
      );
    });
  }

  void init() {
    _bloc.add(LandingGetSimilarByIdEvent(
      queryParametersRequest: QueryParametersRequest(language: "en", page: 1),
      movieId: widget.movieId,
    ));
    _bloc.add(LandingGetMovieByIdEvent(
      queryParametersRequest: QueryParametersRequest(language: "en", page: 1),
      movieId: widget.movieId,
    ));
  }
}
