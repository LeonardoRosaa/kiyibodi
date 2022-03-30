import 'package:flutter/material.dart';
import 'package:kiyibodi/foundation/keyboard_input_type.dart';

class KeyboardInkWell extends StatelessWidget {
  const KeyboardInkWell({
    Key? key,
    required this.child,
    required this.value,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Widget child;

  final KeyboardInputType value;

  final KeyboardInputTypeCallback? onTap;

  final KeyboardInputTypeCallback? onLongPress;

  void _onTap() {
    onTap!(value);
  }

  void _onLongPress() {
    onLongPress!(value);
  }

  bool get canTap => onTap != null;

  bool get canLongPress => onLongPress != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: canTap ? _onTap : null,
      onLongPress: canLongPress ? _onLongPress : null,
      child: child,
    );
  }
}
