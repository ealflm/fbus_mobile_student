import 'package:get/get.dart';

import '../controllers/select_schedule_controller.dart';

class SelectScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectScheduleController>(
      () => SelectScheduleController(),
    );
  }
}
