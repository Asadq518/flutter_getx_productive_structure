import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../core/core.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: LocaleKeys.dashboard.tr, style: context.titleLarge),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => controller.toggleTheme(),
          ),
          // NEW language selector
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: MyAppTranslation.changeLanguage,
            itemBuilder: (_) => [
              for (final locale in MyAppTranslation.supportedLocales)
                PopupMenuItem(
                  value: locale,
                  child: Text(
                    locale.languageCode == 'en'
                        ? 'English'
                        : locale.languageCode == 'ur'
                        ? 'اردو'
                        : locale.toLanguageTag(),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: 16.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(text: LocaleKeys.overview.tr, style: context.headlineLarge),
            16.sbh,
            // For small screens (mobile), use a Column layout, else use Row for bigger screens
            context.isWeb || context.isTablet
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statCard(
                        LocaleKeys.inventory.tr,
                        controller.totalInventory,
                        context,
                      ),
                      _statCard(
                        LocaleKeys.pending.tr,
                        controller.pendingShipments,
                        context,
                      ),
                      _statCard(
                        LocaleKeys.low_stock.tr,
                        controller.lowStockItems,
                        context,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statCard(
                        LocaleKeys.inventory.tr,
                        controller.totalInventory,
                        context,
                      ),
                      8.sbh,
                      _statCard(
                        LocaleKeys.pending.tr,
                        controller.pendingShipments,
                        context,
                      ),
                      8.sbh,
                      _statCard(
                        LocaleKeys.low_stock.tr,
                        controller.lowStockItems,
                        context,
                      ),
                    ],
                  ),
            32.sbh,
            MyText(
              text: LocaleKeys.recent_activities.tr,
              style: context.headlineLarge,
            ),
            16.sbh,
            // GridView for Recent Activities with 2 items per row for web/tablet
            Expanded(
              child: Obx(() {
                final list = controller.recentActivities;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isWeb || context.isTabletCustom
                        ? 2
                        : 1, // 2 columns for Web/Tablet, 1 for Mobile
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final recent = list[i];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation:
                          4, // You can adjust the elevation for shadow effects
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              300, // Set max width to limit the size of the card
                          minHeight:
                              120, // Set minimum height to avoid stretching
                        ),
                        padding: EdgeInsets.all(16), // Adjust padding as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              recent.icon,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            MyText(
                              text: recent.title.tr,
                              style: context.bodyLarge,
                            ),
                            MyText(
                              text: recent.subtitle,
                              style: context.bodySmall,
                            ),
                            Spacer(),
                            MyText(text: recent.time, style: context.bodySmall),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, RxInt value, BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: 8.radius),
        child: Padding(
          padding: 16.vertical,
          child: Column(
            children: [
              Obx(() => MyText(text: value.string, style: context.bodyLarge)),
              4.sbh,
              MyText(text: label, style: context.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
