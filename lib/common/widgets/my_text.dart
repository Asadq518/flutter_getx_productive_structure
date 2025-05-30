import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/core/resources/resources.dart';

class MyText extends StatelessWidget {
  const MyText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign = TextAlign.center,
      this.letterSpacing = .3,
      this.height = 0,
      this.maxLines,
      this.overflow,
      this.decoration,  this.softWrap=false});

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

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
      softWrap: softWrap,
      style: GoogleFonts.urbanist().copyWith(
        decoration: decoration,
      
        height: height,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: (fontWeight ?? FontWeight.w500),
        color: color ?? R.color.black,
      ),
    );
  }
}
