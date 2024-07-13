import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: isLandscape ? 4 / 1 : 3 / 1,
            child: Container(
              color: Colors.orange,
              child: const Center(child: Text('Banner')),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: isLandscape ? 3 : 1,
              children: List.generate(6, (index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Card $index')),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
