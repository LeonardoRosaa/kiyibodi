import 'package:flutter/material.dart';
import 'package:kiyibodi/foundation/keyboard_input_type.dart';
import 'package:kiyibodi/widgets/widgets.dart';

class FlexibleKeyboardInput extends StatelessWidget {
  const FlexibleKeyboardInput({
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
    return Flexible(
      child: KeyboardInput(
        child: child,
        value: value,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
