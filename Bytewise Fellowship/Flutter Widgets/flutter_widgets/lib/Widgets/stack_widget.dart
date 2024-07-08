import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Image.network('https://picsum.photos/id/237/536/354'),
          ),
          Positioned(
            child: Image.network(
              'https://picsum.photos/id/1084/536/354?grayscale',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
