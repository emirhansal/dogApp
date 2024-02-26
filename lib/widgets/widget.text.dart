import 'package:flutter/material.dart';

class RichTextBasic extends StatelessWidget {
  final List<TextSpan>? texts;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const RichTextBasic({Key? key, this.texts, this.textAlign, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        children: texts,
        style: TextStyle(
          decoration: decoration ?? TextDecoration.none,
        ),
      ),
    );
  }
}

class TextBasic extends StatelessWidget {
  final String text;

  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? lineHeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const TextBasic({
    Key? key,
    required this.text,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.lineHeight,
    this.maxLines,
    this.textAlign,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines ?? 999,
      textScaler: const TextScaler.linear(1.0),
      style: TextStyle(
        letterSpacing: letterSpacing ?? 0.0,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 14.0,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: lineHeight ?? 1.2,
      ),
    );
  }
}

TextSpan textSpanBasic({
  String? text,
  Color? color,
  String? fontFamily,
  FontWeight? fontWeight,
  double? fontSize,
  TextDecoration? decoration,
}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: decoration ?? TextDecoration.none,
    ),
  );
}
