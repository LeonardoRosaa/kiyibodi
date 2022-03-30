import 'package:flutter/material.dart';
import 'package:kiyibodi/foundation/keyboard_input_type.dart';
import 'package:kiyibodi/widgets/base/base.dart';
import 'package:kiyibodi/widgets/widgets.dart';

class KeyboardInput extends StatelessWidget {
  const KeyboardInput({
    Key? key,
    this.onTap,
    this.onLongPress,
    this.child,
    required this.value,
  }) : super(key: key);

  final Widget? child;

  final KeyboardInputType value;

  final KeyboardInputTypeCallback? onTap;

  final KeyboardInputTypeCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return KeyboardInkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      value: value,
      child: Center(
        child: child ?? AppText.label(value.getText()!),
      ),
    );
  }
}
