import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiyibodi/kiyibodi.dart';

void main() {
  late KeyboardController controller;

  setUp(() {
    controller = KeyboardController();
  });

  testWidgets('should click a number and concat eight number', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Kiyibodi(controller: controller),
        ),
      ),
    );

    final eightButton = find.byKey(
      const Key('kiyibodiInputEight'),
    );

    await tester.tap(eightButton);

    expect(controller.value.text, '8');
  });

  testWidgets('should delete last number', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Kiyibodi(
            controller: controller..value = controller.value.copyWith(
              text: '8888'
            ),
          ),
        ),
      ),
    );

    final deleteButton = find.byKey(
      const Key('kiyibodiInputRightChild'),
    );

    await tester.tap(deleteButton);

    expect(controller.value.text, '888');
  });

  testWidgets('should long press delete clear all text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Kiyibodi(
            controller: controller..value = controller.value.copyWith(
              text: '8888'
            ),
          ),
        ),
      ),
    );

    final deleteButton = find.byKey(
      const Key('kiyibodiInputRightChild'),
    );

    await tester.longPress(deleteButton);

    expect(controller.value.text.isEmpty, true);
  });

  testWidgets('should respect max lenght', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Kiyibodi(
            controller: controller..value = controller.value.copyWith(
              text: '888'
            ),
            maxLength: 4,
          ),
        ),
      ),
    );

    final eightButton = find.byKey(
      const Key('kiyibodiInputEight'),
    );

    await tester.tap(eightButton);
    await tester.pump();
    await tester.tap(eightButton);
    await tester.pump();

    expect(controller.value.text.length, 4);
  });
}
