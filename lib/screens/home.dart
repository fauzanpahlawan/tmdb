import 'package:flutter/material.dart';
import 'package:tmdb/screens/router/app_router.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/now_playing_movie.dart';
import 'package:tmdb/widgets/popular_movie.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, routeMovieSearch),
              icon: const Icon(Icons.search)),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              decoration: BoxDecoration(color: theme.canvasColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      nowPlayingLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: fontStaatliches,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  NowPlayingMovie(),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              decoration: BoxDecoration(color: theme.canvasColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      popularLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: fontStaatliches,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  PopularMovie(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
