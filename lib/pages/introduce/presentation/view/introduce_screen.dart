import 'package:bussiness_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IntroduceScreen extends GetView<IntroduceController> {
  const IntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Assets.images.imageIntroduceV2.image(
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "We Believe in Service, and you Know that",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s34w600.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "App dành cho nhân viên sales",
                    style: AppTextStyles.s14w400.copyWith(
                      color: AppColors.grayA9,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  PrimaryWidgetButton(
                    title: "Đăng nhập",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
