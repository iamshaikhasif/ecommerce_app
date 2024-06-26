import 'package:ecommerce_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomText(this.text, {this.color, this.fontSize, this.fontWeight, this.fontFamily, super.key, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          color: color ?? kTextColor, fontFamily: fontFamily ?? 'Roboto', fontSize: fontSize ?? 14.sp, fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}