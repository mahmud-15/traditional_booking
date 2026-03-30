import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';

class SuccessController extends GetxController {
  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
