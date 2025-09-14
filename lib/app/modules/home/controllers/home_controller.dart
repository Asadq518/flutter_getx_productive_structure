import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';

class HomeController extends GetxController {
  final totalInventory = 1234.obs;
  final pendingShipments = 12.obs;
  final lowStockItems = 5.obs;
  final recentActivities = <Activity>[].obs;

  Future<void> toggleTheme() async {
    final isCurrentlyDark = Get.isDarkMode;
    final newMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;

    // Switch via GetX
    Get.changeThemeMode(newMode);

    // Persist choice
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newMode == ThemeMode.dark);
  }

  @override
  void onInit() {
    super.onInit();
    recentActivities.addAll([
      Activity(
        Icons.add_box,
        LocaleKeys.received_items,
        'Received 200 units of Item A',
        '2h ago',
      ),
      Activity(
        Icons.outbox,
        LocaleKeys.shipped_order,
        'Shipped 150 units to Client X',
        '5h ago',
      ),
      Activity(
        Icons.assignment_late,
        LocaleKeys.low_stock_alert,
        'Item B below threshold',
        '1d ago',
      ),
    ]);
  }
}

class Activity {
  final IconData icon;
  final String title, subtitle, time;
  Activity(this.icon, this.title, this.subtitle, this.time);
}
