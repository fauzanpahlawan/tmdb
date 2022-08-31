import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/search/search_bloc.dart';
import 'package:tmdb/widgets/search_movie.dart';

class MovieSearch extends StatelessWidget {
  const MovieSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Movie"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          searchTextBoxAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              decoration: BoxDecoration(color: Theme.of(context).canvasColor),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth <= 400) {
                    return const SearchMovie(gridCount: 2);
                  } else if (constraints.maxWidth <= 600) {
                    return const SearchMovie(gridCount: 3);
                  } else if (constraints.maxWidth <= 800) {
                    return const SearchMovie(gridCount: 4);
                  } else if (constraints.maxWidth <= 1000) {
                    return const SearchMovie(gridCount: 5);
                  } else if (constraints.maxWidth <= 1200) {
                    return const SearchMovie(gridCount: 6);
                  } else if (constraints.maxWidth <= 1400) {
                    return const SearchMovie(gridCount: 7);
                  } else if (constraints.maxWidth <= 1600) {
                    return const SearchMovie(gridCount: 8);
                  } else if (constraints.maxWidth <= 1800) {
                    return const SearchMovie(gridCount: 9);
                  } else {
                    return const SearchMovie(gridCount: 10);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar searchTextBoxAppBar(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      title: SizedBox(
        height: 60,
        child: Card(
          elevation: 5.0,
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            onSubmitted: (keyword) => context
                .read<SearchBloc>()
                .add(SearchMovieFetched(keyword: keyword)),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 18,
              ),
              hintText: "Input search query...",
            ),
          ),
        ),
      ),
    );
  }
}
