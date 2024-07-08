import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // Row widget horizontal direction mein multiple widgets ko arrange karta hai
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // horizontal alignmnet set kerne k liye
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //Vertical alignment set kerne k liye
      children: [
        Container(
          // ek rectangular box hai jo styling aur positioning ke liye use hota hai
          color: Colors.amber, //background color set karta hai
          height: 100, //height set karta hai
          width: 100, //width set karta hai
        ),
        Container(
          color: Colors.green,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.blue,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.lime,
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
