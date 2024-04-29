import 'package:ecommerce_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget(
      {super.key, this.color, this.isSelected, this.selectedColor});
  final Color? color, selectedColor;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 25.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: (isSelected ?? false) ? Border.all(
          width: 1,
          color: selectedColor ?? kLightBlue,
        ) : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(1.0.w),
      ),
    );
  }
}
