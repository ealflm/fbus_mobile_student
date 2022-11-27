import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../map/hyper_map_controller.dart';
import 'route_controller.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();
  RouteController route = RouteController();

  Rx<int> step = 0.obs;

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    hyperMapController.moveToCurrentLocationWithoutAnimation();
  }

  void nextStep() {
    if (step.value == 1) {
      Get.toNamed(Routes.SELECT_SCHEDULE);
    } else {
      step.value++;
      route.updateStationItems();
    }
  }

  void previousStep() {
    if (step.value > 0) {
      step.value--;
    }
  }
}
