import 'package:get/get.dart';
import '../controllers/phone_entry_controller.dart';

class PhoneEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneEntryController>(() => PhoneEntryController());
  }
}
