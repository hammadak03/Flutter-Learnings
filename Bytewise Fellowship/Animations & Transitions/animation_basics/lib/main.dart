import 'package:flutter/material.dart';
import 'opacity_animation.dart';
import 'translation_animation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animation Basics',
      home: OpacityAnimation(),
    );
  }
}
