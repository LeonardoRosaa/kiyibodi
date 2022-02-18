import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_text.dart';

import 'keyboard_controller.dart';
import 'keyboard_input.dart';
import 'keyboard_input_type.dart';

class Kiyibodi extends StatelessWidget {
  final KeyboardController keyboardController;
  final Widget? leftChild;
  final Widget? rightChild;
  final bool disabledToIncrease;

  const Kiyibodi({
    required this.keyboardController,
    this.leftChild,
    this.rightChild,
    this.disabledToIncrease = false,
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
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('1'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.one,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('2'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.two,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('3'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.three,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('4'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.four,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('5'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.five,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('6'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.six,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('7'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.seven,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('8'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.eight,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('9'),
                  onTap: disabledToIncrease ? null : onTap,
                  value: KeyboardInputType.nine,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
              child: leftChild ?? Container(),
            ),
            Flexible(
              child: KeyboardInput(
                child: keyboardInputLabel('0'),
                onTap: disabledToIncrease ? null : onTap,
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
