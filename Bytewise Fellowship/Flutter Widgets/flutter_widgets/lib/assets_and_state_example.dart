import 'package:flutter/material.dart';

class AssetsAndStateExample extends StatefulWidget {
  const AssetsAndStateExample({super.key});

  @override
  State<AssetsAndStateExample> createState() => _ExampleStateState();
}

class _ExampleStateState extends State<AssetsAndStateExample> {
  int _imageIndex = 1;

  void changePicture() {
    if (_imageIndex < 2) {
      _imageIndex++;
    } else {
      _imageIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Management & Assets',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 12, 66),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/asset_image${_imageIndex}.jpg',
            height: 300,
          )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                changePicture();
              });
            },
            child: const Text('Change State'),
          )
        ],
      ),
    );
  }
}
