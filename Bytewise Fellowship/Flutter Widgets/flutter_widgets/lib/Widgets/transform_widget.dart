import 'dart:math';

import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  const TransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(pi * 1 / 4),
        child: Image.network('https://picsum.photos/id/1084/536/354?grayscale'),
      ),
    );
  }
}
