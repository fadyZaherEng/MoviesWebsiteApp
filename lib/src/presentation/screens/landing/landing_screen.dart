import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/core/base/widget/base_stateful_widget.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/widgets/carousel_slider.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/widgets/now_playing_widget.dart';
import 'package:movies_website_apps/src/presentation/screens/movie/movie_screen.dart';
import 'package:movies_website_apps/src/presentation/widgets/popular_movies_widget.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/widgets/footer.dart';
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
  final TextEditingController searchTextController = TextEditingController();

  LandingBloc get _bloc => BlocProvider.of<LandingBloc>(context);
  List<Movie> _moviesPlayNow = [];
  List<Movie> _moviesTopRated = [];
  List<Movie> _moviesPopular = [];
  List<Movie> _moviesUpComing = [];

  @override
  void initState() {
    _bloc.add(LandingPlayNowEvent(
        queryParametersRequest: QueryParametersRequest(
            includeAdult: true, includeVideo: true, language: "en", page: 1)));
    _bloc.add(LandingTopRatedEvent(
        queryParametersRequest:
            QueryParametersRequest(language: "en", page: 1)));
    _bloc.add(LandingPopularEvent(
        queryParametersRequest:
            QueryParametersRequest(language: "en", page: 1)));
    _bloc.add(LandingUpcomingEvent(
        queryParametersRequest:
            QueryParametersRequest(language: "en", page: 1)));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(listener: (context, state) {
      if (state is LandingPlayNowSuccess) {
        _moviesPlayNow = state.movies;
      } else if (state is LandingTopRatedSuccess) {
        _moviesTopRated = state.movies;
      } else if (state is LandingPlayNowError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      } else if (state is LandingUpcomingSuccess) {
        _moviesUpComing = state.movies;
      } else if (state is LandingPopularSuccess) {
        _moviesPopular = state.movies;
      } else if (state is LandingSearchSuccess) {
        _moviesPopular = state.movies;
      } else if (state is LandingTopRatedError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      } else if (state is LandingPopularError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      } else if (state is LandingUpcomingError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      } else if (state is LandingSearchError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message ?? "")));
      }
    }, builder: (context, state) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            key: scaffoldKey,
            drawer: CustomDrawer(
              currentPage: Routes.landingWeb,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Top Rated Movies",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: ColorSchemes.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CarouselSliderWidget(
                              isLoading: state is LandingTopRatedLoading,
                              topRatedMovies: _moviesTopRated,
                              onSliderTap: (int movieId) {
                                context.go("${Routes.movie}/$movieId");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MovieScreen(movieId: movieId)));
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Now Playing",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: ColorSchemes.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 450,
                                child: NowPlayingWidget(
                                  isLoading: state is LandingPlayNowLoading,
                                  nowPlayingMovies: _moviesPlayNow,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Popular Movies",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: ColorSchemes.white),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          double gridHeight = state is LandingPopularLoading
                              ? (constraints.maxWidth / 5) * 1.25 * 3
                              : (constraints.maxWidth / 5) *
                                  1.25 *
                                  (_moviesPopular.length / 6);
                          return SizedBox(
                            height: gridHeight,
                            child: PopularMoviesWidget(
                              isLoading: state is LandingPopularLoading,
                              popularMovies: _moviesPopular,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const FooterWidget(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
