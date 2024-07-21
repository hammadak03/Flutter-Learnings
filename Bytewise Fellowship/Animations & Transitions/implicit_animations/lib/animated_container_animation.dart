import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerAnimation extends StatefulWidget {
  const AnimatedContainerAnimation({super.key});

  @override
  State<AnimatedContainerAnimation> createState() =>
      _AnimatedContainerAnimationState();
}

class _AnimatedContainerAnimationState
    extends State<AnimatedContainerAnimation> {
  double randomBorderRadius() {
    return Random().nextDouble() * 64;
  }

  double randomMargin() {
    return Random().nextDouble() * 64;
  }

  Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  List<double> randomSize() {
    return [50 + Random().nextDouble() * 150, 50 + Random().nextDouble() * 150];
  }

  late Color color;
  late double borderRadius;
  late double margin;
  late List<double> size;
  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
      size = randomSize();
    });
  }

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
    size = randomSize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Container',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 20, 92),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: EdgeInsets.all(margin),
              curve: Curves.ease,
              width: size[0],
              height: size[1],
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: color,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  change();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 18, 20, 92),
              ),
              child: const Text(
                'Change',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
