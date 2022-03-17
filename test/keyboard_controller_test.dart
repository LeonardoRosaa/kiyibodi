import 'package:flutter_test/flutter_test.dart';
import 'package:kiyibodi/kiyibodi.dart';

const initialText = '12345';

void main() {
  late KeyboardController controller;

  setUp(() {
    controller = KeyboardController(value: initialText);
  });

  test('should concat text', () {
    controller.handleActionByKeyboardInputType(KeyboardInputType.eight);

    expect(controller.value.text, '${initialText}8');
  });

  test('should delete last text', () {
    controller.handleActionByKeyboardInputType(KeyboardInputType.delete);

    expect(controller.value.text, '1234');
  });

  test('should clear all text', () {
    controller.handleActionByKeyboardInputType(KeyboardInputType.longDelete);

    expect(controller.value.text.isEmpty, true);
  });
}