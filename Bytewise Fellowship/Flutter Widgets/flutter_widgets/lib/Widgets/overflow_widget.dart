import 'package:flutter/material.dart';

class OverflowWidget extends StatelessWidget {
  const OverflowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.orange,
        height: 100,
        width: 100,
        child: OverflowBox(
          maxHeight: 400,
          maxWidth: 200,
          child: Container(
            color: Colors.purple.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
