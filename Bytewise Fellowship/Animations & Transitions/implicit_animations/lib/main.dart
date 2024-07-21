import 'package:flutter/material.dart';
import 'animated_container_animation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Implicit Animations App',
      home: AnimatedContainerAnimation(),
    );
  }
}
