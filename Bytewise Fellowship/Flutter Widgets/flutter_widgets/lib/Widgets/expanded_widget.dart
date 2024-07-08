import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(color: Colors.red),
        ),
        Expanded(
          flex: 2,
          child: Container(color: Colors.blue),
        ),
        Expanded(
          child: Container(color: Colors.green),
        ),
      ],
    );
  }
}
