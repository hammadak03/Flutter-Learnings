import 'package:flutter_test/flutter_test.dart';
import 'package:unit_and_widget_testing/calculator.dart';

void main() {
  group('Calculator', () {
    test('Addition of two numbers', () {
      final calculator = Calculator();

      expect(calculator.add(2, 3), 5);
      expect(calculator.add(-2, 3), 1);
    });

    test('Subtraction of two numbers', () {
      final calculator = Calculator();

      expect(calculator.subtract(5, 2), 3);
      expect(calculator.subtract(2, 5), -3);
    });
  });
}
