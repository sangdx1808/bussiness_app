import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../index.dart';

abstract class ErrorHandle {
  void onError(String meta);

  void onListenEvent(EventBusEventType meta);

  void onListenEventData(dynamic meta) {}
}

abstract class BaseController<T> extends GetxController implements ErrorHandle {
  T? arguments = Get.arguments == null ? null : Get.arguments as T;
  final RxBool _isLoading = true.obs;
  final RxBool _isMoreEnd = true.obs;
  bool get isMoreEnd => _isMoreEnd.value;
  final LocalStorage localStorage = Get.find();

  // final userProfileRxn = Get.find<Rxn<UserProfile>>();

  // UserDivega? get divega => userProfileRxn.value?.divega;

  // UserEndolife? get endo => userProfileRxn.value?.endo;

  // StoreModel? get store => userProfileRxn.value?.store;

  // UserProfile? get userProfile => userProfileRxn.value;

  final compositeSubscription = CompositeSubscription();
  final erbStr = BehaviorSubject<String>();
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    _listenEventBus();
    _listenErrorEvent();
    super.onInit();
  }

  void showLoading() {
    if (EasyLoading.isShow) return;
    AppUtils.dismissKeyboard();
    // EasyLoading.show(
    //   indicator: SizedBox(
    //     width: 30.w,
    //     height: 30.w,
    //     child: const CircularProgressIndicator(
    //       color: AppColors.primary,
    //     ),
    //   ),
    // );
  }

  // void showLoadingV2() {
  //   if (EasyLoading.isShow) return;
  //   AppUtils.dismissKeyboard();
  //   EasyLoading.show(
  //     dismissOnTap: true,
  //     indicator: SizedBox(
  //       width: 30.w,
  //       height: 30.w,
  //       child: const CircularProgressIndicator(
  //         color: AppColors.primary,
  //       ),
  //     ),
  //   );
  // }

  void dismissLoading() {
    EasyLoading.dismiss();
  }

  /// lắng nghe các event của app
  void _listenEventBus() {
    EventBusUtils().listenEvent().listen((event) {
      if (isClosed) return;
      if (event is EventBusEventType) {
        onListenEvent(event);
        return;
      } else {
        onListenEventData(event);
      }
    }).addTo(compositeSubscription);
  }

  ///lắng nghe error từ dio trả về
  void _listenErrorEvent() {
    erbStr.listen((error) {
      onError(error);
    }).addTo(compositeSubscription);
  }

  // Future<void> saveUserProfile(UserProfile userProfile) async {
  //   userProfileRxn.value = userProfile;
  //   await localStorage.save(PrefKeys.user, json.encode(userProfile));
  // }

  @override
  void onClose() {
    compositeSubscription.cancel();
    super.onClose();
  }

  @override
  void onListenEvent(EventBusEventType meta) {}

  @override
  void onError(String meta) {}

  @override
  void onListenEventData(dynamic meta) {}

  Future<String?> uploadImage(
    String imagePath,
    IUploadRepository uploadRepository,
  ) async {
    final BaseDataDynamic? result = await uploadRepository
        .uploadFile(imagePath)
        .onApiError(erbStr)
        .catchError((_) => null);
    if (result?.status == 'OK') {
      return result?.data['url'] as String?;
    }
    return null;
  }

  void setMore(List<dynamic>? items) {
    _isMoreEnd.value = (items?.length ?? 0) >= Constants.limitPage;
  }
}
