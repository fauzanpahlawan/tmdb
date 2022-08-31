import 'package:flutter/material.dart';

class FailureIndicator extends StatelessWidget {
  const FailureIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        width: 300,
        height: 300,
        child: const Text(
            "Something wrong, check network connection or try again later."),
      ),
    );
  }
}
