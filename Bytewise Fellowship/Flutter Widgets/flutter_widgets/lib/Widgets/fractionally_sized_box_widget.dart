import 'package:flutter/material.dart';

class FractionallySizedBoxWidget extends StatelessWidget {
  const FractionallySizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        color: Colors.grey,
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.5,
          alignment: Alignment.center,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
