import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? maxFontSize;
  final double? minFontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.maxFontSize,
    this.minFontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? const TextStyle();
    final targetMax = maxFontSize ?? baseStyle.fontSize ?? 14;
    final screenWidth = MediaQuery.of(context).size.width;
    const referenceWidth = 375.0;
    final scale = screenWidth / referenceWidth;
    final fontSize = (targetMax * scale).clamp(
      minFontSize ?? 8.0,
      targetMax,
    );

    return Text(
      text,
      style: baseStyle.copyWith(fontSize: fontSize),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
    );
  }
}
