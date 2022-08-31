import 'package:flutter/material.dart';

class SuchEmptyIndicator extends StatelessWidget {
  const SuchEmptyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Text("Such empty..."),
      ),
    );
  }
}
