import 'dart:ffi';

import 'package:ecommerce_app/common/common_button.dart';
import 'package:ecommerce_app/common/custom_text.dart';
import 'package:ecommerce_app/constant/color.dart';
import 'package:ecommerce_app/constant/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animate = false;
  double opacity = 0.0;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            //AppBar
            AnimatedPositioned(
              top: animate ? 10.h : -10.h,
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: MediaQuery.of(context).size.width - 30.w,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      child: Icon(Icons.filter_list,
                          color: kWhiteColor, size: 22.sp),
                    ),
                    CustomText('E-Commerce',
                        fontSize: 18.sp, fontWeight: FontWeight.w700),
                    CommonButton(
                      child: Icon(Icons.card_travel,
                          size: 20.sp, color: kWhiteColor),
                    ),
                  ],
                ),
              ),
            ),

            //Offer Card
            AnimatedPositioned(
              top: animate ? 50.h : 80.h,
              duration: const Duration(milliseconds: 500),
              child: AnimatedOpacity(
                opacity: opacity,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30.w,
                  height: 150.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Image.asset(
                    ImageResource.homebanner,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: animate ? 40.h : 100.h,
              duration: const Duration(milliseconds: 800),
              child: AnimatedOpacity(
                opacity: opacity,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 700),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30.w,
                  height: 150.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText('50% Off',
                              fontSize: 30.sp,
                              fontFamily: 'Roboto_Medium',
                              fontWeight: FontWeight.w900),
                          CustomText('unbelievable visual & \nperformance',
                              fontSize: 13.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                          Container(
                            height: 30.h,
                            width: 90.w,
                            margin: EdgeInsets.only(left: 85.w),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: kTextColor, width: 1.r),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Center(
                                child: CustomText('Buy Now',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 15.w),
                          child: Image.asset(
                            'assets/images/headphone.png',
                            height: 140.h,
                            width: 140.w,
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
