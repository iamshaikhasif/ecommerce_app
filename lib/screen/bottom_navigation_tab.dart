import 'package:ecommerce_app/common/common_button.dart';
import 'package:ecommerce_app/constant/color.dart';
import 'package:ecommerce_app/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationTab extends StatefulWidget {
  const BottomNavigationTab({super.key});

  @override
  State<BottomNavigationTab> createState() => _BottomNavigationTabState();
}

class _BottomNavigationTabState extends State<BottomNavigationTab> {
  int currentIndex = 0;
  List screens = const [
    HomePage(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: '',
            activeIcon: CommonButton(
              height: 45.h,
              width: 55.w,
              child: const Icon(Icons.home_filled),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.grid_view),
            label: '',
            activeIcon: CommonButton(
              height: 45.h,
              width: 55.w,
              child: const Icon(Icons.grid_view_rounded),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: '',
            activeIcon: CommonButton(
              height: 45.h,
              width: 55.w,
              child: const Icon(Icons.search),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_rounded),
            label: '',
            activeIcon: CommonButton(
              height: 45.h,
              width: 55.w,
              child: const Icon(Icons.favorite_rounded),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: '',
            activeIcon: CommonButton(
              height: 45.h,
              width: 55.w,
              child: const Icon(Icons.person),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedItemColor: kTextColor,
        backgroundColor: kOffWhiteColor,
        selectedItemColor: kWhiteColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24.sp,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 20,
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
