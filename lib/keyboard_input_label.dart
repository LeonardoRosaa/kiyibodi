import 'package:flutter/material.dart';

import 'keyboard_text.dart';

class KeyboardInputLabel extends StatelessWidget {
  final String text;

  const KeyboardInputLabel(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: KeyboardText.keyboardInputText,
    );
  }
}
