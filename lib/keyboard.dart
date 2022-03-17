import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_editing_value.dart';
import 'package:kiyibodi/widgets/base/text.dart';

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
  var canEmitOnDone = true;

  @override
  void initState() {
    super.initState();

    widget.keyboardController.addListener(() {
      _handleOnDone();
      _handleDisabledNumber();
    });
  }

  void _handleOnDone() {
    if (isLenghtEqualsKeyboardValue && widget.onDone != null && canEmitOnDone) {
      widget.onDone!(widget.keyboardController.value.text);
      canEmitOnDone = false;
    } else if (!isLenghtEqualsKeyboardValue) {
      canEmitOnDone = true;
    }
  }

  void _handleDisabledNumber() {
    widget.keyboardController.disabledNumbers(isLenghtEqualsKeyboardValue);
  }

  bool get isLenghtEqualsKeyboardValue => widget.length == null
      ? false
      : widget.keyboardController.value.text.length >= widget.length!;

  void onTap(KeyboardInputType keyboardInputType) {
    widget.keyboardController
        .handleActionByKeyboardInputType(keyboardInputType);
  }

  void _onLongPress() {
    widget.keyboardController
        .handleActionByKeyboardInputType(KeyboardInputType.longDelete);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<KiyibodiEditingValue>(
        valueListenable: widget.keyboardController,
        builder: (context, editingValue, _) {
          return Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('1'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.one,
                      key: const Key('kiyibodiInputOne'),
                    ),
                  ),
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('2'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.two,
                      key: const Key('kiyibodiInputTwo'),
                    ),
                  ),
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('3'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.three,
                      key: const Key('kiyibodiInputThree'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('4'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.four,
                      key: const Key('kiyibodiInputFour'),
                    ),
                  ),
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('5'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.five,
                      key: const Key('kiyibodiInputFive'),
                    ),
                  ),
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('6'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.six,
                      key: const Key('kiyibodiInputSix'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('7'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.seven,
                      key: const Key('kiyibodiInputSeven'),
                    ),
                  ),
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('8'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.eight,
                      key: const Key('kiyibodiInputEight'),
                    ),
                  ),
                  Flexible(
                    child: KeyboardInput(
                      child: AppText.label('9'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.nine,
                      key: const Key('kiyibodiInputNine'),
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
                      child: AppText.label('0'),
                      onTap: editingValue.disabled ? null : onTap,
                      value: KeyboardInputType.zero,
                      key: const Key('kiyibodiInputZero'),
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
                      key: const Key('kiyibodiInputRightChild'),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
