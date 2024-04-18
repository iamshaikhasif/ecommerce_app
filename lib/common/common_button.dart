import 'package:ecommerce_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const CommonButton({required this.child, this.height, this.width, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height ?? 30.h,
            width: width ?? 40.h,
            transform: Matrix4.rotationZ(-0.13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(17.r),
                bottomRight: Radius.circular(23.r),
                bottomLeft: Radius.circular(20.r),
              ),
              color: kLightBlue,
            ),
            // child: Center(child: child),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h, left: 5.w),
            child: child,
          )
        ],
      ),
    );
  }
}
