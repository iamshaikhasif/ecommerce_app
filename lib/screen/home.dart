import 'package:ecommerce_app/common/common_button.dart';
import 'package:ecommerce_app/common/custom_text.dart';
import 'package:ecommerce_app/constant/color.dart';
import 'package:ecommerce_app/constant/custom_data.dart';
import 'package:ecommerce_app/constant/duration.dart';
import 'package:ecommerce_app/constant/image.dart';
import 'package:ecommerce_app/model/gadget_detail.dart';
import 'package:ecommerce_app/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animate = false;
  double opacity = 0.0;

  List companyName = ['All', 'Apple', 'Samsung', 'HuaWei', 'Google'];

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //AppBar
              Container(
                width: MediaQuery.of(context).size.width - 30.w,
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
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
              )
                  .animate()
                  .slide(
                    duration: CustomDuration.duration700,
                  )
                  .fade(
                      duration: CustomDuration.duration700,
                      curve: Curves.easeIn),

              //Offer Card

              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 30.w,
                    height: 150.h,
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Image.asset(
                      ImageResource.homebanner,
                      fit: BoxFit.fill,
                    ),
                  ).animate().fade(
                      duration: CustomDuration.duration700,
                      curve: Curves.easeIn),
                  Container(
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
                                border:
                                    Border.all(color: kTextColor, width: 1.r),
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
                            ImageResource.headphone,
                            height: 140.h,
                            width: 140.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .slideX(
                        duration: CustomDuration.duration800,
                      )
                      .fade(
                          duration: CustomDuration.duration800,
                          curve: Curves.easeIn),
                ],
              ),

              //Heading label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                child: CustomText(
                  "Trending Brand",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ).animate().fade(
                  duration: CustomDuration.duration800, curve: Curves.easeIn),

              //Brand List
              Container(
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: ListView.builder(
                  itemCount: companyName.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.only(right: 18.w),
                        child: CommonButton(
                            height: 30.h,
                            width: 40.h,
                            child: CustomText(companyName[index],
                                fontWeight: FontWeight.w600,
                                color: kWhiteColor,
                                fontSize: 13.sp)),
                      ).animate().fade(
                          duration: CustomDuration.duration700,
                          curve: Curves.easeIn);
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: 6.h, right: 18.w),
                        child: CustomText(
                          companyName[index],
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ).animate().fade(
                          duration: CustomDuration.duration700,
                          curve: Curves.easeIn);
                    }
                  },
                ),
              ),

              //catogrey list
              SizedBox(
                height: 160.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: gadgetList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    GadgetDetail item = gadgetList[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(AppRouterName.detailPage, extra: item);
                      },
                      child: Container(
                        height: 160.h,
                        width: 145.w,
                        margin: EdgeInsets.only(
                            right: index == gadgetList.length - 1 ? 15.w : 10.w,
                            left: index == 0 ? 15.w : 0.w),
                        padding: EdgeInsets.all(13.r),
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: "${item.image}",
                              child: Image.asset(
                                "${item.image}",
                                height: 85.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                CustomText(gadgetList[index].name!,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp),
                                const Spacer(),
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded,
                                        size: 15.sp, color: kTextColor),
                                    CustomText(' 4.8',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                CustomText('\$${gadgetList[index].price}',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp),
                                const Spacer(),
                                Row(
                                  children: [
                                    Icon(Icons.favorite,
                                        size: 14.sp, color: kTextColor),
                                    CustomText(' 86%',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).animate().fadeIn(duration: 1000.ms),
                      )
                          .animate()
                          .slideX(
                            delay: (50 * index).ms,
                            duration: (200 * index).ms,
                          )
                        ,
                    );
                  },
                ),
              ),

              //Recommended label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                child: CustomText('Recommended',
                    fontWeight: FontWeight.w700, fontSize: 18.sp),
              ).animate().slideX(duration: 700.ms),

              //Recommended Item
              SizedBox(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: gadgetreCommendationList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    GadgetDetail item = gadgetreCommendationList[index];
                    return GestureDetector(
                      onTap: (){
                        context.push(AppRouterName.detailPage, extra: item);
                      },
                      child: Container(
                        height: 140.h,
                        width: MediaQuery.of(context).size.width * .8,
                        margin: EdgeInsets.only(
                            right: index == gadgetreCommendationList.length - 1
                                ? 15.w
                                : 10.w,
                            left: index == 0 ? 15.w : 0.w),
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 140.h,
                              width: MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                color: item.imageColor,
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              child: Image.asset(
                                  item.image ?? ImageResource.airpods),
                            ),
                            SizedBox(width: 10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                CustomText(item.name!,
                                    fontFamily: 'Roboto_Medium',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp),
                                SizedBox(height: 5.h),
                                CustomText("\$16.62/mo",
                                    fontFamily: 'Roboto_Bold',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star_rounded,
                                            size: 15.sp, color: kTextColor),
                                        CustomText(' 4.8',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp)
                                      ],
                                    ),
                                    SizedBox(width: 10.w),
                                    Row(
                                      children: [
                                        Icon(Icons.favorite,
                                            size: 14.sp, color: kTextColor),
                                        CustomText(' 86%',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.sp)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Icon(Icons.note_add,
                                        size: 15.sp, color: kTextColor),
                                    CustomText(' Free delivery',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp)
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                Row(
                                  children: [
                                    Icon(Icons.redo,
                                        size: 15.sp, color: kTextColor),
                                    CustomText(' Free returns',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
