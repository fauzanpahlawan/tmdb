import 'package:flutter/material.dart';

class StartSearchIndicator extends StatelessWidget {
  const StartSearchIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: const <Widget>[
          Icon(
            Icons.search,
            size: 128,
          ),
          Text("Such empty..."),
          Text("Start typing a movie keyword!"),
        ],
      ),
    );
  }
}
