import 'package:flutter/material.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/utils/constants.dart';

class MovieOverview extends StatelessWidget {
  final Movie movie;
  const MovieOverview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                movieOverview,
                style: TextStyle(
                  fontFamily: fontRaleway,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 10),
              Text(movie.overview),
            ],
          ),
        ),
      ),
    );
  }
}
