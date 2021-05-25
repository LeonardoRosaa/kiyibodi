import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_text.dart';

import 'keyboard_controller.dart';
import 'keyboard_input.dart';
import 'keyboard_input_type.dart';

class Kiyibodi extends StatelessWidget {
  final KeyboardController keyboardController;
  final Widget? leftChild;
  final Widget? rightChild;

  const Kiyibodi({
    required this.keyboardController,
    this.leftChild,
    this.rightChild,
    Key? key,
  }) : super(key: key);

  Widget keyboardInputLabel(String text) {
    return Text(
      text,
      style: KeyboardText.keyboardInputText,
    );
  }

  void _resolveKeyboardInputType(KeyboardInputType keyboardInputType) {
    switch (keyboardInputType) {
      case KeyboardInputType.delete:
        keyboardController.deleteLast();
        break;
      case KeyboardInputType.longDelete:
        keyboardController.clear();
        break;
      default:
        keyboardController.increase(keyboardInputType.value.toString());
    }
  }

  void onTap(KeyboardInputType keyboardInputType) {
    _resolveKeyboardInputType(keyboardInputType);
  }

  void _onLongPress() {
    _resolveKeyboardInputType(KeyboardInputType.longDelete);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('1'),
                onTap: onTap,
                value: KeyboardInputType.one,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('2'),
                onTap: onTap,
                value: KeyboardInputType.two,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('3'),
                onTap: onTap,
                value: KeyboardInputType.three,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('4'),
                onTap: onTap,
                value: KeyboardInputType.four,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('5'),
                onTap: onTap,
                value: KeyboardInputType.five,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('6'),
                onTap: onTap,
                value: KeyboardInputType.six,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('7'),
                onTap: onTap,
                value: KeyboardInputType.seven,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('8'),
                onTap: onTap,
                value: KeyboardInputType.eight,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('9'),
                onTap: onTap,
                value: KeyboardInputType.nine,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: leftChild ?? Container(),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('0'),
                onTap: onTap,
                value: KeyboardInputType.zero,
              ),
            ),
            Flexible(
              child: KeyboardInput(
                child: rightChild ??
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                onTap: onTap,
                value: KeyboardInputType.delete,
                onLongPress: (_) {
                  _onLongPress();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
