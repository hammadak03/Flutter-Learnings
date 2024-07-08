import 'package:flutter/material.dart';

class IntrinsicHeightAndWidthWidgets extends StatelessWidget {
  const IntrinsicHeightAndWidthWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            Container(
              color: Colors.blue,
              height: 200,
              width: 150,
            ),
            Container(
              color: Colors.green,
              height: 200,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
