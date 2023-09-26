import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRouter.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRouter.test,
      page: () => Container(
        height: 100,
        width: 100,
        color: AppColors.black,
      ),
    )
  ];
}
