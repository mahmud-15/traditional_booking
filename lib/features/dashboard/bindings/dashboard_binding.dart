import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../message/controllers/message_controller.dart';
import '../../notification/controllers/notification_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => ProfileController());
  }
}
