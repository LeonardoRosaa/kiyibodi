import 'package:flutter/material.dart';
import 'package:kiyibodi/foundation/keyboard_editing_value.dart';

import 'keyboard_input_type.dart';

class KeyboardController extends ValueNotifier<KiyibodiEditingValue> {
  KeyboardController({String? value})
      : super(
          value == null
              ? KiyibodiEditingValue.empty()
              : KiyibodiEditingValue(
                  text: value,
                  disabled: false,
                ),
        );

  void clearText() {
    value = value.copyWith(text: '');
  }

  void concatText(String text) {
    var oldText = value.text;
    value = value.copyWith(text: oldText += text);
  }

  void deleteLastText() {
    if (value.text.isNotEmpty) {
      value = value.copyWith(
        text: value.text.substring(
          0,
          value.text.length - 1,
        ),
      );
    }
  }

  void handleActionByKeyboardInputType(KeyboardInputType keyboardInputType) {
    switch (keyboardInputType) {
      case KeyboardInputType.delete:
        deleteLastText();
        break;
      case KeyboardInputType.longDelete:
        clearText();
        break;
      default:
        concatText(keyboardInputType.getText()!);
    }
  }

  void disabledNumbers(bool disabled) {
    if (disabled != value.disabled) {
      value = value.copyWith(disabled: disabled);
    }
  }

  bool isMaxLength(int? max) => value.text.length == max;
}