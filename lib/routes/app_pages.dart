import 'package:get/get.dart';

import '../index.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRouter.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      binding: IntroduceBinding(),
      name: AppRouter.introduce,
      transition: Transition.rightToLeft,
      page: () => const IntroduceScreen(),
    )
  ];
}
