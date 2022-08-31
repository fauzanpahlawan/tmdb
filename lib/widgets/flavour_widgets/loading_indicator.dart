import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: SizedBox(
        width: 90,
        height: 90,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
