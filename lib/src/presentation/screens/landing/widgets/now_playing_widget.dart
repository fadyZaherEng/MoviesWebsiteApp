import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/config/theme/color_schemes.dart';
import 'package:movies_website_apps/src/core/utils/constants.dart';
import 'package:movies_website_apps/src/domain/entities/landing/movie.dart';
import 'package:skeletons/skeletons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NowPlayingWidget extends StatelessWidget {
  final bool isLoading;
  final List<Movie> nowPlayingMovies;

  const NowPlayingWidget({
    super.key,
    required this.isLoading,
    required this.nowPlayingMovies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: isLoading ? 5 : nowPlayingMovies.length,
      itemBuilder: (context, index) {
        return isLoading
            ? SkeletonItem(
                child: ListTile(
                  leading: Container(
                    color: Colors.black12,
                    width: 80,
                    height: 120,
                  ),
                  title: Container(
                    color: Colors.black12,
                    height: 20,
                  ),
                  subtitle: Container(
                    color: Colors.black12,
                    height: 40,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading:CachedNetworkImage(
                   imageUrl:  "${Constants.imageBaseUrl}${nowPlayingMovies[index].posterPath}",
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => SkeletonLine(
                      style: SkeletonLineStyle(
                        width: 80,
                        height: 120,
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    matchTextDirection: true,
                    placeholder: (context, _) {
                      return SkeletonLine(
                        style: SkeletonLineStyle(
                          width: 80,
                          height: 120,
                          borderRadius: BorderRadius.circular(8)
                        )
                      );
                    }
                  ),
                  title: Text(
                    nowPlayingMovies[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: ColorSchemes.white),
                  ),
                  subtitle: Text(nowPlayingMovies[index].overview,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorSchemes.gray),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
              );
      },
    );
  }
}
