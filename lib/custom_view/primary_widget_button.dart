import 'package:bussiness_app/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrimaryWidgetButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double? height;
  const PrimaryWidgetButton({
    super.key,
    required this.title,
    this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: height ?? 62.h,
        width: Get.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 32.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.s16w600.copyWith(
            height: 1,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
