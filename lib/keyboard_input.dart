import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard_input_type.dart';

class KeyboardInput extends StatelessWidget {
  final Widget child;
  final KeyboardInputType value;
  final Function(KeyboardInputType)? onTap;
  final Function(KeyboardInputType)? onLongPress;

  const KeyboardInput({
    required this.child,
    this.onTap,
    required this.value,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () {
              onTap!(value);
            }
          : null,
      onLongPress: onLongPress != null
          ? () {
              if (onLongPress != null) {
                onLongPress!(value);
              }
            }
          : null,
      child: Center(
        child: child,
      ),
    );
  }
}
