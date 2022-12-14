import 'package:get/get.dart';

import '../controllers/controlpage_controller.dart';

class ControlpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControlpageController>(
      () => ControlpageController(),
    );
  }
}
