import 'package:flutter/material.dart';

class ConstrainedboxWidget extends StatelessWidget {
  const ConstrainedboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 50,
          minWidth: 100,
        ),
        child: Container(
          height: double.infinity,
          width: 0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
