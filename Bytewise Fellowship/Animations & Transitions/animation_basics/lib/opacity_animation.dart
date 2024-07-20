import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  double _opacityValue = 1.0;
  String _buttonText = 'Hide Logo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Opcatiy Animation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 8, 41, 68),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              curve: Curves.bounceIn,
              opacity: _opacityValue,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(
                size: 100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 41, 68),
              ),
              onPressed: () {
                setState(() {
                  _opacityValue = _opacityValue == 1 ? 0 : 1;
                  _buttonText =
                      _buttonText == 'View Logo' ? 'Hide Logo' : 'View Logo';
                });
              },
              child: Text(
                _buttonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
