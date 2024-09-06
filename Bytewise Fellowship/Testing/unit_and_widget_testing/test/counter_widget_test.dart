import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_and_widget_testing/counter_widget.dart';

void main() {
  testWidgets('Counter increments when button is tapped',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

    // Verify initial counter value
    expect(find.text('Counter: 0'), findsOneWidget);
    expect(find.text('Counter: 1'), findsNothing);

    // Tap the increment button and trigger a frame
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the counter has incremented
    expect(find.text('Counter: 1'), findsOneWidget);
    expect(find.text('Counter: 0'), findsNothing);
  });
}
