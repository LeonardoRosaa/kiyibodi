import 'package:flutter_test/flutter_test.dart';
import 'package:kiyibodi/kiyibodi.dart';

void main() {
  group('keyboard input type test', () {
    test('get text', () {
      expect(KeyboardInputType.zero.getText(), "0");
      expect(KeyboardInputType.one.getText(), "1");
      expect(KeyboardInputType.two.getText(), "2");
      expect(KeyboardInputType.three.getText(), "3");
      expect(KeyboardInputType.four.getText(), "4");
      expect(KeyboardInputType.five.getText(), "5");
      expect(KeyboardInputType.six.getText(), "6");
      expect(KeyboardInputType.seven.getText(), "7");
      expect(KeyboardInputType.eight.getText(), "8");
      expect(KeyboardInputType.nine.getText(), "9");

      expect(KeyboardInputType.longDelete.getText(), null);
      expect(KeyboardInputType.delete.getText(), null);
    });
  });
}
