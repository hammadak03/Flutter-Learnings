import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Column widget vertical direction mein multiple widgets ko arrange karta hai
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //widgets ko vertically align kerta hai
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //widgets ko vertically align kerta hai
      children: [
        Container(
          color: Colors.amber,
          height: 100,
          width: 100,
          child: const FlutterLogo(),
          // simply Flutter ka logo dikhata hai
        ),
        Container(
          color: Colors.purple,
          height: 100,
          width: 100,
          child: const Icon(
            Icons.flutter_dash,
            size: 100,
            color: Colors.white,
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          width: 100,
          child: const Text('GG'),
        ),
        Container(
          color: Colors.red,
          height: 100,
          width: 100,
          child: Image.network('https://picsum.photos/id/1060/536/354?blur=2'),
          // Image widget image show kerta hai from asset or network in this case
        ),
      ],
    );
  }
}
