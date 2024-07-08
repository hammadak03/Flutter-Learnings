import 'package:flutter/material.dart';

class OffStageWidget extends StatefulWidget {
  const OffStageWidget({super.key});

  @override
  State<OffStageWidget> createState() => _OffStageWidgetState();
}

class _OffStageWidgetState extends State<OffStageWidget> {
  bool isHided = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Offstage(
          offstage: isHided,
          child: const Icon(
            Icons.flutter_dash,
            size: 100,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isHided = !isHided;
            });
          },
          child: Text('isHided = $isHided'),
        )
      ],
    );
  }
}
