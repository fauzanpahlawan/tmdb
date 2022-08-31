import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/movie_cast.dart';
import 'package:tmdb/utils/constants.dart';

class MovieCastCard extends StatelessWidget {
  final MovieCast movieCast;
  const MovieCastCard({Key? key, required this.movieCast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: 150,
        child: Card(
          elevation: 5.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/profile.jpg"),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(strokeWidth: 1),
                  imageUrl: "$imageBaseUrl${movieCast.profilePath}",
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      movieCast.name,
                      style: const TextStyle(fontFamily: fontRaleway),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movieCast.character,
                      style: const TextStyle(fontFamily: fontRaleway),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
