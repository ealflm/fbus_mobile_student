import 'package:get/get.dart';

import '../../map/hyper_map_controller.dart';
import 'route_controller.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();
  RouteController routeController = RouteController();

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    hyperMapController.moveToCurrentLocationWithoutAnimation();
  }
}
