import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../index.dart';

class AppUtils {
  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void haptic() {
    HapticFeedback.heavyImpact();
  }

  static Future copyText(String value, String msg) async {
    await Clipboard.setData(ClipboardData(text: value));
    // ToastUtil.showToast(msg);
  }

  static void popUntil(String routes) {
    Navigator.popUntil(Get.context!, ModalRoute.withName(routes));
  }

  static String get uuidV4 => const Uuid().v4();
  static String get uuidV1 => const Uuid().v1();

  static List<TextInputFormatter>? get inputPhoneFormat {
    return [
      LengthLimitingTextInputFormatter(Constants.maxPhoneLength),
      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      TextInputFormatter.withFunction((oldValue, newValue) {
        if (newValue.text.startsWith('0') && newValue.text.length > 1) {
          return const TextEditingValue().copyWith(
            text: newValue.text.replaceAll(RegExp('^0+(?=.)'), ''),
            selection: newValue.selection.copyWith(
              baseOffset: newValue.text.length - 1,
              extentOffset: newValue.text.length - 1,
            ),
          );
        } else {
          return newValue;
        }
      }),
    ];
  }

  static void setText(
    String value,
    TextEditingController controller,
  ) {
    controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.fromPosition(
        TextPosition(offset: value.length),
      ),
    );
  }

  static Future<void> shareData({
    required Uint8List data,
    String? name,
    String? mimeType,
  }) async {
    Share.shareXFiles(
      [
        XFile.fromData(
          data,
          name: name,
          mimeType: mimeType,
        ),
      ],
    );
  }

  static Future<void> shareText({
    required String value,
  }) async {
    Share.share(value);
  }

  static bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null || !RegExp(r'^-?[0-9]+$').hasMatch(phoneNo)) {
      return false;
    }
    return (phoneNo.length == 10 && phoneNo.startsWith('0')) ||
        (phoneNo.length == 11 && phoneNo.startsWith('84'));
  }

  static int kycIdentityOffsetY(int height) => (height * 0.27).toInt();

  static int kycIdentityOffsetX(int width) => (width * 0.1).toInt();

  static int kycIdentityWidth(int width) =>
      width - (2 * kycIdentityOffsetX(width));

  static int kycIdentityHeight(int width) => kycIdentityWidth(width) ~/ 1.5;

  static int kycPortraitRadius(int width) => (width * 0.7).toInt();

  static int kycPortraitSize(int width) => (width * 0.9).toInt();

  static int kycPortraitOffsetX(int width) => (width * 0.05).toInt();

  static int kycPortraitOffsetY(int height) => (height * 0.2).toInt();

  // static List<ProductModel> removeProductDuplicates(List<ProductModel> items) {
  //   final List<ProductModel> uniqueItems = []; // uniqueList
  //   final uniqueIDs =
  //       items.map((e) => e.id).toSet(); //list if UniqueID to remove duplicates
  //   uniqueIDs.forEach((e) {
  //     uniqueItems.add(items.firstWhere((i) => i.id == e));
  //   }); // populate uniqueItems with equivalent original Batch items
  //   return uniqueItems; //send back the unique items list
  // }

  // static List<AuctionDetailsModel> removeAuctionDuplicates(
  //     List<AuctionDetailsModel> items) {
  //   final List<AuctionDetailsModel> uniqueItems = []; // uniqueList
  //   final uniqueIDs =
  //       items.map((e) => e.id).toSet(); //list if UniqueID to remove duplicates
  //   uniqueIDs.forEach((e) {
  //     uniqueItems.add(items.firstWhere((i) => i.id == e));
  //   }); // populate uniqueItems with equivalent original Batch items
  //   return uniqueItems; //send back the unique items list
  // }

  // static Widget getWalletIconByType(WalletEnum type, {double? size}) {
  //   switch (type) {
  //     case WalletEnum.TRX:
  //       return Assets.icons.icCryptocurrencyTrx
  //           .image(width: size ?? 32.w, height: size ?? 32.w);
  //     case WalletEnum.ETH:
  //       return Assets.icons.icCryptocurrencyEth
  //           .image(width: size ?? 32.w, height: size ?? 32.w);
  //     case WalletEnum.BNB:
  //       return Assets.icons.icCryptocurrencyBnb
  //           .image(width: size ?? 32.w, height: size ?? 32.w);
  //     case WalletEnum.USDT:
  //       return Assets.icons.icCryptocurrencyUsdt
  //           .image(width: size ?? 32.w, height: size ?? 32.w);
  //     case WalletEnum.HYRA:
  //       return Assets.icons.icCryptocurrencyHydra
  //           .image(width: size ?? 32.w, height: size ?? 32.w);
  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }
}
