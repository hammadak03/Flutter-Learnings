import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            Image.network('https://picsum.photos/id/1084/536/354?grayscale'),
            Image.network('https://picsum.photos/id/1084/536/354?grayscale'),
            Image.network('https://picsum.photos/id/1084/536/354?grayscale'),
            Image.network('https://picsum.photos/id/1084/536/354?grayscale'),
          ],
        ),
      ),
    );
  }
}
