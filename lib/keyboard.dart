import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_editing_value.dart';
import 'package:kiyibodi/widgets/base/text.dart';
import 'package:kiyibodi/widgets/flexible_keyboard_input.dart';

import 'keyboard_controller.dart';
import 'keyboard_input_type.dart';

class Kiyibodi extends StatefulWidget {
  /// The controller to keyboard.
  final KeyboardController keyboardController;

  final Widget? leftChild;

  final Widget? rightChild;

  /// Disabled [onTap] of numbers.
  final bool disabledNumbers;

  /// Length to disabled input for concat and call [onDone].
  final int? maxLength;

  /// Called function when controller value lenght contains
  /// same value of [length] parameter.
  final void Function(String)? onDone;

  const Kiyibodi({
    Key? key,
    required this.keyboardController,
    this.leftChild,
    this.rightChild,
    this.disabledNumbers = false,
    this.maxLength,
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
    if (isMaxLength && widget.onDone != null && canEmitOnDone) {
      widget.onDone!(widget.keyboardController.value.text);
      canEmitOnDone = false;
    } else if (!isMaxLength) {
      canEmitOnDone = true;
    }
  }

  void _handleDisabledNumber() {
    widget.keyboardController.disabledNumbers(isMaxLength);
  }

  bool get isMaxLength =>
      widget.keyboardController.value.text.length == widget.maxLength;

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
        final onTap = editingValue.disabled ? null : this.onTap;

        return Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  FlexibleKeyboardInput(
                    child: AppText.label('1'),
                    onTap: onTap,
                    value: KeyboardInputType.one,
                    key: const Key('kiyibodiInputOne'),
                  ),
                  FlexibleKeyboardInput(
                    child: AppText.label('2'),
                    onTap: onTap,
                    value: KeyboardInputType.two,
                    key: const Key('kiyibodiInputTwo'),
                  ),
                  FlexibleKeyboardInput(
                    child: AppText.label('3'),
                    onTap: onTap,
                    value: KeyboardInputType.three,
                    key: const Key('kiyibodiInputThree'),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  FlexibleKeyboardInput(
                    child: AppText.label('4'),
                    onTap: onTap,
                    value: KeyboardInputType.four,
                    key: const Key('kiyibodiInputFour'),
                  ),
                  FlexibleKeyboardInput(
                    child: AppText.label('5'),
                    onTap: onTap,
                    value: KeyboardInputType.five,
                    key: const Key('kiyibodiInputFive'),
                  ),
                  FlexibleKeyboardInput(
                    child: AppText.label('6'),
                    onTap: onTap,
                    value: KeyboardInputType.six,
                    key: const Key('kiyibodiInputSix'),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  FlexibleKeyboardInput(
                    child: AppText.label('7'),
                    onTap: onTap,
                    value: KeyboardInputType.seven,
                    key: const Key('kiyibodiInputSeven'),
                  ),
                  FlexibleKeyboardInput(
                    child: AppText.label('8'),
                    onTap: onTap,
                    value: KeyboardInputType.eight,
                    key: const Key('kiyibodiInputEight'),
                  ),
                  FlexibleKeyboardInput(
                    child: AppText.label('9'),
                    onTap: onTap,
                    value: KeyboardInputType.nine,
                    key: const Key('kiyibodiInputNine'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: widget.leftChild ?? Container(),
                ),
                FlexibleKeyboardInput(
                  child: AppText.label('0'),
                  onTap: onTap,
                  value: KeyboardInputType.zero,
                  key: const Key('kiyibodiInputZero'),
                ),
                FlexibleKeyboardInput(
                  child: widget.rightChild ??
                      Icon(
                        Icons.arrow_back_ios,
                      ),
                  onTap: this.onTap,
                  value: KeyboardInputType.delete,
                  onLongPress: (_) {
                    _onLongPress();
                  },
                  key: const Key('kiyibodiInputRightChild'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
