import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_editing_value.dart';
import 'package:kiyibodi/widgets/base/text.dart';
import 'package:kiyibodi/widgets/flexible_keyboard_input.dart';

import 'keyboard_controller.dart';
import 'keyboard_input_type.dart';

class Kiyibodi extends StatefulWidget {
  /// The controller to keyboard.
  final KeyboardController controller;

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
    this.leftChild,
    this.rightChild,
    this.disabledNumbers = false,
    this.maxLength,
    this.onDone,
    required this.controller,
  }) : super(key: key);

  @override
  State<Kiyibodi> createState() => _KiyibodiState();
}

class _KiyibodiState extends State<Kiyibodi> {
  /// One of condititions for control whether to emits `onDone` method.
  var _canDone = true;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      _handleOnDone();
      _handleDisabledNumber();
    });
  }

  void _handleOnDone() {
    if (_canProccessOnDone) {
      widget.onDone!(_controller.value.text);
      _canDone = false;
    } else if (!_isMaxLength) {
      _canDone = true;
    }
  }

  void _handleDisabledNumber() {
    _controller.disabledNumbers(_isMaxLength);
  }

  void _onTap(KeyboardInputType keyboardInputType) {
    _controller.handleActionByKeyboardInputType(keyboardInputType);
  }

  void _onLongPress() {
    _controller.handleActionByKeyboardInputType(KeyboardInputType.longDelete);
  }

  /// Verify whether emits `onDone` method
  bool get _canProccessOnDone => _isMaxLength && widget.onDone != null && _canDone;

  /// Verify [controller.value.text] length is equals [maxLength]
  bool get _isMaxLength => _controller.isMaxLength(widget.maxLength);

  /// The short access for [widget.controller]
  KeyboardController get _controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<KiyibodiEditingValue>(
      valueListenable: _controller,
      builder: (context, editingValue, _) {
        final onTap = editingValue.disabled ? null : this._onTap;

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
                  onTap: this._onTap,
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
