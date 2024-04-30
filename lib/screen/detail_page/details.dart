import 'package:ecommerce_app/common/color_widget.dart';
import 'package:ecommerce_app/common/common_button.dart';
import 'package:ecommerce_app/common/custom_text.dart';
import 'package:ecommerce_app/common/feature_item.dart';
import 'package:ecommerce_app/constant/color.dart';
import 'package:ecommerce_app/model/gadget_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.gadgetDetail});
  final GadgetDetail? gadgetDetail;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      bottomNavigationBar: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: widget.gadgetDetail!.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomText(
                '\$${widget.gadgetDetail!.price}',
                fontSize: 18.sp,
                fontFamily: robotoBoldFontFamily,
              ),
            ).animate().fadeIn(duration: 1000.ms).slideX(duration: 1000.ms, begin: -1, end: 0),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                child: CustomText(
                  "Add to Cart",
                  color: kWhiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: robotoBoldFontFamily,
                ),
              ),
            ).animate().slideX(duration: 1000.ms, begin: 1, end: 0).fadeIn(duration: 1000.ms),
          ],
        ),
      ),
      body: Stack(
        children: [
          //bg half circle
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 300.h,
              width: 250.w,
              decoration: BoxDecoration(
                color: widget.gadgetDetail!.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(210.r),
                ),
              ),
            ),
          ),

          //Body
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonButton(
                          onTap: () {
                            context.pop();
                          },
                          color: widget.gadgetDetail!.color,
                          child: Icon(Icons.arrow_back_ios,
                              color: kWhiteColor, size: 22.sp),
                        ).animate().fadeIn(duration: 1000.ms),
                        CommonButton(
                          color: Colors.transparent,
                          child: Icon(Icons.favorite_border,
                              color: kWhiteColor, size: 28.sp),
                        ).animate().fadeIn(duration: 1000.ms),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Hero(
                    tag: widget.gadgetDetail!.image!,
                    child: Transform.rotate(
                      angle: 0.3,
                      child: Image.asset(
                        widget.gadgetDetail!.image!,
                        height: 270.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //abou product
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //color
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ColorWidget(
                              color: Colors.black,
                              selectedColor: widget.gadgetDetail!.color,
                              isSelected: true,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ColorWidget(
                              color: Colors.grey,
                              selectedColor: widget.gadgetDetail!.color,
                              isSelected: false,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ColorWidget(
                              color: Colors.green,
                              selectedColor: widget.gadgetDetail!.color,
                              isSelected: false,
                            ),
                          ],
                        ).animate().slideX(duration: 1000.ms).fadeIn(duration: 1000.ms),

                        //main Feature
                        Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FeatureItemWidget(
                                  icon: Icons.cast, label: "Wireless"),
                              FeatureItemWidget(
                                  icon: Icons.headphones_rounded,
                                  label: "Headphone"),
                              FeatureItemWidget(
                                  icon: Icons.call_rounded, label: "Call"),
                              FeatureItemWidget(
                                  icon: Icons.bluetooth_rounded,
                                  label: "Bluetooth"),
                            ],
                          ).animate().slideX(duration: 1000.ms).fadeIn(duration: 1000.ms),
                        ),

                        CustomText(
                          widget.gadgetDetail!.name!,
                          fontFamily: robotoBoldFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ).animate().fadeIn(duration: 1000.ms, delay: 1000.ms),
                        CustomText(
                          "A smartwatch is a wearable computer device in the form of a watch that provides a local touchscreen interface for daily use, while an associated smartphone app provides management and telemetry, such as long-term biomonitoring. The aluminum case is lightweight and made from 100 percent recycled aerospace-grade alloy.",
                          fontFamily: robotoFontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          textAlign: TextAlign.justify,
                        ).animate().fadeIn(duration: 1000.ms, delay: 1000.ms),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
