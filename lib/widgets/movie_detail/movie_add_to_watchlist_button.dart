import 'package:flutter/material.dart';

class MovieAddToWatchListButton extends StatefulWidget {
  const MovieAddToWatchListButton({Key? key}) : super(key: key);

  @override
  State<MovieAddToWatchListButton> createState() =>
      _MovieAddToWatchListButtonState();
}

class _MovieAddToWatchListButtonState extends State<MovieAddToWatchListButton> {
  var inWatchList = false;
  void setFavorite() {
    setState(() {
      inWatchList = !inWatchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: setFavorite,
      icon: Icon(
        inWatchList ? Icons.bookmark_added_rounded : Icons.bookmark_add_rounded,
        color: inWatchList ? Colors.greenAccent : Colors.green,
      ),
    );
  }
}
