import 'package:flutter/material.dart';

class BaselineWidget extends StatelessWidget {
  const BaselineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.amber,
        child: const Baseline(
          baseline: -100,
          baselineType: TextBaseline.alphabetic,
          child: FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }
}
