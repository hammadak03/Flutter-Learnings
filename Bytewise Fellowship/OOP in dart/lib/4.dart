// ignore_for_file: file_names

import 'dart:math';

class RandomBox<T> {
  List<T> _items = [];

  // Method to add an item to the box
  void add(T item) {
    _items.add(item);
  }

  // Method to check if the box is empty
  bool isEmpty() {
    return _items.isEmpty;
  }

  // Method to draw an item randomly from the box
  T? drawItem() {
    if (isEmpty()) {
      print("Box is empty. Cannot draw item.");
      return null;
    }

    Random random = Random();
    int randomIndex = random.nextInt(_items.length);
    return _items[randomIndex];
  }
}

void main() {
  RandomBox<String> stringBox = RandomBox<String>();

  stringBox.add("A");
  stringBox.add("B");
  stringBox.add("C");

  // Drawing items from the box
  for (int i = 0; i < 5; i++) {
    String? item = stringBox.drawItem();
    if (item != null) {
      print("Drawn item: $item");
    }
  }

  // Testing with integers
  RandomBox<int> intBox = RandomBox<int>();

  // Adding integers to the box
  intBox.add(1);
  intBox.add(2);
  intBox.add(3);

  // Drawing integers from the box
  for (int i = 0; i < 4; i++) {
    int? item = intBox.drawItem();
    if (item != null) {
      print("Drawn item: $item");
    }
  }

  // Testing drawItem on an empty box
  RandomBox<double> emptyBox = RandomBox<double>();
  print("Trying to draw from an empty box...");
  double? emptyItem = emptyBox.drawItem();
  if (emptyItem == null) {
    print("Drawn item is null. Box is empty.");
  }
}
