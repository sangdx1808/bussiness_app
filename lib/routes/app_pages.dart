import 'package:get/get.dart';

import '../index.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRouter.home,
      page: () => const HomeScreen(),
    )
  ];
}
