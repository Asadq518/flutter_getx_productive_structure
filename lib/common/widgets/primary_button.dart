import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pcom_app/common/widgets/my_text.dart';

import '../../app/core/resources/resources.dart';
import 'smooth_rectangle_border.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    required this.text,
    Color? color,
    Color? textcolor,
    this.disable = false,
    this.small = false,
    this.outlined = false,
    this.iconBtn = false,
    this.iconRightAlign = false,
    this.iconBtnPadding = false,
    this.fontSize = 18,
    this.width = 0.4,
    this.borderRadius = 16,
    this.icon = "",
    required this.onPressed,
    this.shadowColor = false,
  })  : color = color ?? R.color.primary,
        textcolor = textcolor ?? R.color.white;

  final bool disable;
  final bool shadowColor;
  final String text;
  final String icon;
  final Color color;
  final Color textcolor;
  final double fontSize;
  final VoidCallback onPressed;
  final bool small;
  final bool iconBtn;
  final bool iconBtnPadding;
  final bool iconRightAlign;
  final bool outlined;
  final double width;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: small ? width.sw : 1.sw,
        height: iconBtn ? 48.h : 45.h,
        child: iconBtn
            ? Directionality(
                textDirection:
                    iconRightAlign ? TextDirection.rtl : TextDirection.ltr,
                child: ElevatedButton.icon(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: SvgPicture.asset(
                      icon,
                      height: 22,
                      width: 22,
                      fit: BoxFit.cover,
                      color: outlined ? R.color.primary : textcolor,
                    ),
                  ),
                  label: MyText(
                    text: text,
                    fontSize: fontSize.sp,
                    fontWeight: FontWeight.w600,
                    color: outlined ? R.color.primary : textcolor,
                  ),
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    padding: iconBtnPadding ? const EdgeInsets.all(8) : null,
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: outlined ? Colors.white : color,
                    shape: SmoothRectangleBorder(
                      smoothness: 1,
                      borderRadius: BorderRadius.circular(borderRadius),
                      side: BorderSide(
                          color:
                              outlined ? R.color.primary : Colors.transparent),
                    ),
                    elevation: 2.0,
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: width == 0.2 || width == 0.25
                      ? const EdgeInsets.all(8)
                      : null,
                  shadowColor: shadowColor ? Colors.black : Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: outlined ? Colors.white : color,
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    side: BorderSide(
                        color: outlined ? R.color.primary : Colors.transparent),
                    borderRadius: BorderRadius.circular(borderRadius - 4),
                  ),
                  elevation: 2.0,
                ),
                child: MyText(
                  text: text,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: outlined ? R.color.primary : textcolor,
                ),
              ),
      ),
    );
  }
}
