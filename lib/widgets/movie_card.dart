import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/models/navigation_arguments.dart';
import 'package:tmdb/screens/router/app_router.dart';
import 'package:tmdb/utils/constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String origin;
  const MovieCard({Key? key, required this.movie, required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 150,
        child: Card(
          elevation: 5.0,
          child: InkWell(
            splashColor: Theme.of(context).splashColor,
            onTap: () => Navigator.pushNamed(context, routeMovieDetail,
                arguments: NavigationArguments(movie: movie, origin: origin)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: moviePosterTag(movieId: movie.id, origin: origin),
                  child: CachedNetworkImage(
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/image_not_found.jpg"),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(strokeWidth: 2),
                      imageUrl: "$imageBaseUrl${movie.posterPath}"),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Icon(
                          Icons.star,
                          color: Colors.amber.shade800,
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Text(
                            "${movie.voteAverage}",
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          fontFamily: fontRaleway, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Poster dimension
//W:H = 2:3