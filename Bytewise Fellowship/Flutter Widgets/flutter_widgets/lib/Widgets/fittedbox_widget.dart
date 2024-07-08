import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey,
        height: 200,
        width: 100,
        child: const FittedBox(
          fit: BoxFit.fill,
          child: Text('GGWP'),
        ),
      ),
    );
  }
}
