import 'package:bussiness_app/pages/introduce/presentation/controller/index.dart';
import 'package:get/get.dart';

class IntroduceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IntroduceController(),
    );
  }
}
