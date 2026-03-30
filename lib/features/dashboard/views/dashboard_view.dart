import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../home/views/home_view.dart';
import '../../message/views/message_view.dart';

import '../../profile/views/profile_view.dart';
import '../../../core/widgets/bottom_nav_bar/common_bottom_nav_bar.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeView(),
            Scaffold(
              body: Center(
                child: Text("Properties View", style: TextStyle(fontSize: 18)),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text("Services View", style: TextStyle(fontSize: 18)),
              ),
            ),
            MessageView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(
          () => CommonBottomNavBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTabIndex,
          ),
        ),
      ),
    );
  }
}
