import 'package:fbus_mobile_student/app/modules/ticket/controllers/ticket_controller.dart';
import 'package:get/get.dart';

import '../../account/controllers/account_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../notification/controllers/notification_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<TicketController>(
      () => TicketController(),
    );
  }
}
