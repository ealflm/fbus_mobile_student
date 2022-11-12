import 'package:fbus_mobile_student/app/modules/map/hyper_map_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    await Future.delayed(const Duration(milliseconds: 800));
    hyperMapController.moveToCurrentLocation();
  }
}
