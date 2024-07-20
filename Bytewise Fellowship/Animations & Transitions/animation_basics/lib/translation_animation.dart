import 'package:flutter/material.dart';

class TranslationAnimation extends StatefulWidget {
  const TranslationAnimation({super.key});

  @override
  State<TranslationAnimation> createState() => _TranslationAnimationState();
}

class _TranslationAnimationState extends State<TranslationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double? _deviceHeight;
  double? _deviceWidth;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          'Translation Animation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 8, 72),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: _deviceWidth! * 0.60,
              height: _deviceHeight! * 0.40,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.purple],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
            AnimatedBuilder(
              animation: _controller!.view,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_controller!.value, _controller!.value * -100),
                  child: child,
                );
              },
              child: FlutterLogo(
                size: _deviceWidth! * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
