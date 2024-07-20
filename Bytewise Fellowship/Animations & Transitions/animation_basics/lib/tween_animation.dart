import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  double _targetValue = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tween Animation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 8, 41, 68),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _targetValue),
          duration: const Duration(milliseconds: 500),
          builder: (context, double size, Widget? child) {
            return IconButton(
              iconSize: size,
              onPressed: () {
                setState(() {
                  _targetValue = _targetValue == 100 ? 250 : 100;
                });
              },
              color: Colors.orange,
              icon: const Icon(
                Icons.flutter_dash,
              ),
            );
          },
        ),
      ),
    );
  }
}
