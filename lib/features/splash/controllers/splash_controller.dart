import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(AppRoutes.onboarding);
  }
}
