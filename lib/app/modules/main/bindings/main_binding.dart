import 'package:fbus_mobile_student/app/modules/booking/controllers/booking_controller.dart';
import 'package:fbus_mobile_student/app/modules/home/controllers/home_controller.dart';
import 'package:fbus_mobile_student/app/modules/ticket/controllers/ticket_controller.dart';
import 'package:get/get.dart';

import '../../account/controllers/account_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.put(
      HomeController(),
      permanent: true,
    );
    Get.lazyPut<TicketController>(
      () => TicketController(),
    );
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
