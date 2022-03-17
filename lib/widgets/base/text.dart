import 'package:flutter/material.dart';
import 'package:kiyibodi/core/theme/data/typography.dart';

/// The [AppText] display a String
class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    Key? key,
    required this.style,
  }) : super(key: key);

  const AppText.label(
    String data, {
    Key? key,
  }) : this(
          data,
          key: key,
          style: AppTypographyData.label,
        );

  /// The text to display
  final String data;

  /// The style for this text
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style);
  }
}
