import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/utils/constants.dart';

class MovieBackDrop extends StatelessWidget {
  final Movie movie;
  const MovieBackDrop({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5.0,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const SizedBox(),
          placeholder: (context, url) => const Align(
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          imageUrl: "$imageBaseUrl${movie.backdropPath}",
        ),
      ),
    );
  }
}
