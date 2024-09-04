import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/data/sources/remote/movies/landing/request/query_paramters_request.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:movies_website_apps/src/presentation/blocs/landing/landing_bloc.dart';
import 'package:movies_website_apps/src/presentation/screens/landing/widgets/footer.dart';
import 'package:skeletons/skeletons.dart';

class SearchResultScreen extends StatefulWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<Movie> _movies = [];

  LandingBloc get _bloc => BlocProvider.of<LandingBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(
      LandingSearchEvent(
        queryParametersRequest: QueryParametersRequest(
          language: "en",
          page: 1,
          query: widget.query,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(listener: (context, state) {
      if (state is LandingSearchSuccess) {
        _movies = state.movies;
      } else if (state is LandingSearchError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message ?? ""),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Search Results for "${widget.query}"'),
        ),
        body: state is LandingSearchLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: _movies.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final movie = _movies[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 6,
                          child: InkWell(
                            onTap: () {
                              context.go('/movie/${movie.id}');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                      imageUrl:
                                          '${Constants.imageBaseUrl}${movie.posterPath}',
                                      width: 100,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              const SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                width: 100,
                                                height: 150,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8),
                                                ),
                                              )),
                                      matchTextDirection: true,
                                      placeholder: (context, _) {
                                        return const SkeletonLine(
                                            style: SkeletonLineStyle(
                                          width: 100,
                                          height: 150,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                        ));
                                      }),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          movie.title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          movie.overview,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Text(
                                                      'Vote Count: ${movie.voteCount}')
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.trending_up,
                                                    color: Colors.orange,
                                                  ),
                                                  Text(
                                                      'Popularity: ${movie.popularity}')
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.green,
                                                  ),
                                                  Text(
                                                      'Release Date: ${movie.releaseDate}')
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const FooterWidget(),
                  ],
                ),
              ),
      );
    });
  }
}
