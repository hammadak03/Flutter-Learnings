import 'package:flutter/material.dart';
import '../widgets/layout_widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const WideScreenLayout();
        } else if (constraints.maxWidth > 800) {
          return const MediumScreenLayout();
        } else {
          return const SmallScreenLayout();
        }
      },
    );
  }
}
