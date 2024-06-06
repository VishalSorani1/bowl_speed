import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.label,
    required this.style, 
     this.textAlign = TextAlign.start,
  });
  final String label;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      softWrap: true,
      textScaler: TextScaler.noScaling,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: style,
      textAlign: textAlign,
    );
  }
}
