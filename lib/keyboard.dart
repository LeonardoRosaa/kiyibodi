import 'package:flutter/material.dart';

import 'package:kiyibodi/keyboard_text.dart';

import 'keyboard_controller.dart';
import 'keyboard_input.dart';
import 'keyboard_input_type.dart';

class Kiyibodi extends StatefulWidget {
  /// The controller to keyboard.
  final KeyboardController keyboardController;

  final Widget? leftChild;

  final Widget? rightChild;

  /// Disabled [onTap] of numbers.
  final bool disabledNumbers;

  /// Lenght to disabled input for concat and call [onDone].
  final int? length;

  /// Called function when controller value lenght contains
  /// same value of [length] parameter.
  final void Function(String)? onDone;

  const Kiyibodi({
    Key? key,
    required this.keyboardController,
    this.leftChild,
    this.rightChild,
    this.disabledNumbers = false,
    this.length,
    this.onDone,
  }) : super(key: key);

  @override
  State<Kiyibodi> createState() => _KiyibodiState();
}

class _KiyibodiState extends State<Kiyibodi> {
  @override
  void initState() {
    super.initState();
    if (widget.onDone != null) {
      widget.keyboardController.addListener(_handleOnDone);
    }
  }

  void _handleOnDone() {
    final canCalledOnDoneFunction =
        widget.keyboardController.value.length == widget.length;

    if (canCalledOnDoneFunction) {
      widget.onDone!(widget.keyboardController.value);
    }
  }

  Widget keyboardInputLabel(String text) {
    return Text(
      text,
      style: KeyboardText.keyboardInputText,
    );
  }

  void _resolveKeyboardInputType(KeyboardInputType keyboardInputType) {
    switch (keyboardInputType) {
      case KeyboardInputType.delete:
        widget.keyboardController.deleteLast();
        break;
      case KeyboardInputType.longDelete:
        widget.keyboardController.clear();
        break;
      default:
        widget.keyboardController.increase(keyboardInputType.value.toString());
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
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('1'),
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.one,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('2'),
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.two,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('3'),
                  onTap: widget.disabledNumbers ? null : onTap,
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
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.four,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('5'),
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.five,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('6'),
                  onTap: widget.disabledNumbers ? null : onTap,
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
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.seven,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('8'),
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.eight,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('9'),
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.nine,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: widget.leftChild ?? Container(),
              ),
              Flexible(
                child: KeyboardInput(
                  child: keyboardInputLabel('0'),
                  onTap: widget.disabledNumbers ? null : onTap,
                  value: KeyboardInputType.zero,
                ),
              ),
              Flexible(
                child: KeyboardInput(
                  child: widget.rightChild ??
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
      ),
    );
  }
}
