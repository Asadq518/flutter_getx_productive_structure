import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../app/core/resources/resources.dart';

Future<dynamic> showSimpleCloseDialog() {
  return Get.defaultDialog(
    title: 'Close App',
    middleText: 'Are you sure you want to close the app?',
    textCancel: 'Cancel',
    textConfirm: 'Close',
    confirmTextColor: R.color.white,
    cancelTextColor: R.color.black,
    buttonColor: R.color.primary,
    backgroundColor: R.color.white,
    radius: 20,
    onConfirm: () {
      Get.back();
      SystemNavigator.pop();
    },
    onCancel: () {
      Get.back();
    },
  );
}
