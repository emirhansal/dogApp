import 'package:dog/widgets/widget.text.dart';
import 'package:flutter/material.dart';

class ButtonBasic extends StatelessWidget {
  final TextBasic? textBasic;
  final Color? bgColor;
  final Color? disabledColor;
  final double radius;
  final double? elevation;
  final BorderSide borderSide;
  final VoidCallback? onPressed;
  final String? text;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? child;
  final EdgeInsets? padding;
  final TextAlign? textAlign;

  const ButtonBasic({
    Key? key,
    this.textBasic,
    this.bgColor,
    this.disabledColor,
    this.radius = 14.0,
    this.elevation = 0.0,
    this.borderSide = BorderSide.none,
    this.onPressed,
    this.text,
    this.textColor,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.child,
    this.padding,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: borderSide,
      ),
      color: bgColor ?? Colors.blueAccent,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      disabledColor: disabledColor,
      onPressed: onPressed,
      child: textBasic ??
          child ??
          TextBasic(
            text: text ?? '',
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 14.0,
            fontWeight: fontWeight,
            textAlign: textAlign,
          ),
    );
  }
}
