import 'package:flutter/material.dart';

class MovieFavoriteButton extends StatefulWidget {
  const MovieFavoriteButton({Key? key}) : super(key: key);

  @override
  State<MovieFavoriteButton> createState() => _MovieFavoriteButtonState();
}

class _MovieFavoriteButtonState extends State<MovieFavoriteButton> {
  var favorite = false;
  void setFavorite() {
    setState(() {
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: setFavorite,
      icon: Icon(
        favorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: Colors.redAccent,
      ),
    );
  }
}
