import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        height: 200,
        width: double.infinity,
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }
}
