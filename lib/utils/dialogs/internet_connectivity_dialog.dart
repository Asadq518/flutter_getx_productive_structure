import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_settings/open_settings.dart';

import '../../app/core/resources/resources.dart';

Future<dynamic> internetConnectivityAlterDialog() {
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.all(0),
    contentPadding: const EdgeInsets.all(0),
    // backgroundColor: whiteColor,
    radius: 20,
    content: Column(
      children: [
        SvgPicture.asset(
          'assets/icons/ic_alert.svg',
          // ignore: deprecated_member_use
          color: Colors.yellow,
        ),
        Text(
          'No Internet Connection Found!',
          style: TextStyle(
              // color: primaryColor,
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontSize: 16.sp),
        ),
        Text(
          'Please enable your internet',
          style: TextStyle(
              // color: blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 1,
          // color: blackColor,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                        OpenSettings.openDataRoamingSetting();
                      },
                      child: Icon(
                        Icons.sim_card,
                        color: R.color.black,
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: VerticalDivider(
                  thickness: .5,
                  color: R.color.black,
                ),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                        OpenSettings.openWIFISetting();
                      },
                      child: Icon(
                        Icons.wifi,
                        color: R.color.black,
                      ))),
            ],
          ),
        ),
      ],
    ),
  );
}
