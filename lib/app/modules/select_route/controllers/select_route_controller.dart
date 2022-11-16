import 'package:get/get.dart';

import '../../map/hyper_map_controller.dart';
import 'route.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();
  Route route = Route();

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    hyperMapController.moveToCurrentLocationWithoutAnimation();
  }
}
