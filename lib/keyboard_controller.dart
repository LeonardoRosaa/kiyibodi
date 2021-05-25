import 'package:flutter/material.dart';

class KeyboardController extends ValueNotifier<String> {
  KeyboardController({String? value}) : super(value = '');

  void clear() {
    value = '';
  }

  void increase(String text) {
    value += text;
  }

  void deleteLast() {
    if (value.isNotEmpty) {
      value = value.substring(
        0,
        value.length - 1,
      );
    }
  }
}
