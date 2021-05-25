import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_input_type.dart';

class KeyboardInput extends StatelessWidget {
  final Widget child;
  final KeyboardInputType value;
  final Function(KeyboardInputType) onTap;
  final Function(KeyboardInputType)? onLongPress;

  const KeyboardInput({
    required this.child,
    required this.onTap,
    required this.value,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(value);
      },
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress!(value);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
