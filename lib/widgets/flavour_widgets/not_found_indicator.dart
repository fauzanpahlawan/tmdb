import 'package:flutter/material.dart';

class NotFoundIndicator extends StatelessWidget {
  const NotFoundIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: const <Widget>[
          Icon(
            Icons.search_off_outlined,
            size: 128,
          ),
          Text("No such movie exist..."),
          Text("Try a different keyword!"),
        ],
      ),
    );
  }
}
