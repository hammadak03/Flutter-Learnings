import 'package:flutter/material.dart';
import 'content_area.dart';

class WideScreenLayout extends StatelessWidget {
  const WideScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
            child: const Center(child: Text('Navigation')),
          ),
        ),
        const Expanded(
          flex: 8,
          child: ContentArea(),
        ),
      ],
    );
  }
}

class MediumScreenLayout extends StatelessWidget {
  const MediumScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          height: 60,
          child: const Center(child: Text('Navigation')),
        ),
        const Expanded(
          child: ContentArea(),
        ),
      ],
    );
  }
}

class SmallScreenLayout extends StatelessWidget {
  const SmallScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: ContentArea(),
        ),
      ],
    );
  }
}
