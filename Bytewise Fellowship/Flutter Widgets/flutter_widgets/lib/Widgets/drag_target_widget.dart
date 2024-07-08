import 'package:flutter/material.dart';

class DragTargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DragTarget Example')),
        body: Center(child: DragDropExample()),
      ),
    );
  }
}

class DragDropExample extends StatefulWidget {
  @override
  _DragDropExampleState createState() => _DragDropExampleState();
}

class _DragDropExampleState extends State<DragDropExample> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Draggable<Color>(
          data: Colors.blue,
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.5),
            child: const Center(
                child: Text('Dragging', style: TextStyle(color: Colors.white))),
          ),
          childWhenDragging: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.2),
            child: const Center(
                child: Text('Drag me', style: TextStyle(color: Colors.white))),
          ),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(
                child: Text('Drag me', style: TextStyle(color: Colors.white))),
          ),
        ),
        const SizedBox(height: 20),
        DragTarget<Color>(
          onAccept: (color) {
            setState(() {
              caughtColor = color;
            });
          },
          onWillAccept: (color) {
            return true;
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 200,
              height: 200,
              color: caughtColor,
              child: const Center(
                  child:
                      Text('Drop here', style: TextStyle(color: Colors.white))),
            );
          },
        ),
      ],
    );
  }
}
