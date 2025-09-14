import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    this.fontSize,
    this.style,
    this.fontWeight,
    this.color,
    this.textAlign = TextAlign.center,
    this.letterSpacing = .3,
    this.height = 0,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.softWrap = false,
  });

  final String text;
  final bool softWrap;
  final double? fontSize;
  final double? height;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    // Use the provided style, or default to Urbanist seeded from bodyMedium
    // If the caller passed a style, use it; otherwise seed from the theme
    final base =
        style ??
        GoogleFonts.urbanist(
          textStyle: Theme.of(context).textTheme.bodyMedium!,
        );

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
      softWrap: softWrap,
      style: base.copyWith(
        fontSize: fontSize ?? base.fontSize,
        fontWeight: fontWeight ?? base.fontWeight,
        color: color ?? base.color,
        letterSpacing: letterSpacing ?? base.letterSpacing,
        height: height ?? base.height,
        decoration: decoration ?? base.decoration,
      ),
    );
  }
}
