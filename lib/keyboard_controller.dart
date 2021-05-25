import 'package:flutter/material.dart';

class KeyboardController extends ValueNotifier<String> {
  KeyboardController({String? value}) : super(value = '');

  clear() {
    value = '';
  }

  increase(String text) {
    value += text;
  }

  deleteLast() {
    value = value.substring(
      0,
      value.length - 1,
    );
  }
}
