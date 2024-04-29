import 'package:ecommerce_app/common/custom_text.dart';
import 'package:ecommerce_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureItemWidget extends StatelessWidget {
  const FeatureItemWidget({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 22.h,
        ),
        CustomText(
          label,
          fontFamily: robotoFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
