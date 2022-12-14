import 'package:get/get.dart';

import '../controllers/monitoringpage_controller.dart';

class MonitoringpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringpageController>(
      () => MonitoringpageController(),
    );
  }
}
