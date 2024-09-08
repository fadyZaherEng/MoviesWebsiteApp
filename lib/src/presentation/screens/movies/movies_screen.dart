import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_website_apps/src/config/routes/routes_manager.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/widgets/footer.dart';
import 'package:movies_website_apps/src/presentation/screens/movies/widgets/movies_filter_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_app_bar_widget.dart';
import 'package:movies_website_apps/src/presentation/widgets/custom_drawer.dart';
import 'package:movies_website_apps/src/presentation/widgets/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  bool _isDrawerOpen = false;
  List<Movie> _topRatedMovies = [];
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _upcomingMovies = [];
  List<Movie> _currentMovies = [];
  int _selectedFilterIndex = 0;
  final TextEditingController searchTextController=TextEditingController();

  LandingBloc get _bloc => BlocProvider.of<LandingBloc>(context);

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
  Widget build(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(listener: (context, state) {
      if (state is LandingPlayNowSuccess) {
        _nowPlayingMovies = state.movies;
      } else if (state is LandingTopRatedSuccess) {
        _topRatedMovies = state.movies;
      } else if (state is LandingPlayNowError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      } else if (state is LandingUpcomingSuccess) {
        _upcomingMovies = state.movies;
      } else if (state is LandingPopularSuccess) {
        _popularMovies = state.movies;
        if (_selectedFilterIndex == 0) {
          _currentMovies = _popularMovies;
        }
      } else if (state is LandingSearchSuccess) {
        _currentMovies = state.movies;
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
          drawer: CustomDrawer(
            currentPage: Routes.movies,
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      'Explore Movies',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  MoviesFilterWidget(
                    topRatedMovies: _topRatedMovies,
                    nowPlayingMovies: _nowPlayingMovies,
                    popularMovies: _popularMovies,
                    upcomingMovies: _upcomingMovies,
                    currentMovies: _currentMovies,
                    onChange: (index, movies) {
                      setState(() {
                        _selectedFilterIndex = index;
                        _currentMovies = movies;
                      });
                    },
                    selectedFilterIndex: _selectedFilterIndex,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Explore Popular Movies",
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
                                (_currentMovies.length / 6);
                        return SizedBox(
                          height: gridHeight,
                          child: MoviesWidget(
                            isLoading: state is LandingPopularLoading,
                            popularMovies: _currentMovies,
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
          ));
    });
  }
}
