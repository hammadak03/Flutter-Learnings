import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  const PaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        color: Colors.grey,
        child: Padding(
          // padding: EdgeInsets.all(20),
          // padding: EdgeInsets.only(right: 20),
          // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Text('Padding'),
        ),
      ),
    );
  }
}
