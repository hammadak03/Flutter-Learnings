import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableButton(
                onTap: () {
                  print("Click me is pressed");
                },
                buttonText: 'Click Me',
                color: Colors.green,
                // color: Colors.red,
              ),
              ReusableButton(
                onTap: () {
                  print("Hello World is pressed");
                },
                buttonText: 'Hello World',
                color: Colors.blue,
                // color: Colors.red,
              ),
              ReusableButton(
                onTap: () {
                  print('Hello Bytewise is pressed');
                },
                buttonText: 'Hello Bytewise',
                color: Colors.orange,
                // color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableButton extends StatelessWidget {
  Color color;
  String buttonText;
  VoidCallback onTap;
  ReusableButton(
      {required this.onTap,
      required this.color,
      required this.buttonText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 150,
          height: 50,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
