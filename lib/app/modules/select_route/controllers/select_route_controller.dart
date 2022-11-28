import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../map/hyper_map_controller.dart';
import 'route_data_service.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();
  RouteDataService routeDataService = RouteDataService();

  @override
  void onInit() {
    Get.put(RouteDataService());
    super.onInit();
  }

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    hyperMapController.moveToCurrentLocationWithoutAnimation();
  }

  Widget routesPolyline() {
    return Obx(
      () {
        List<Polyline> polylines = [];

        for (var route in routeDataService.routes.values) {
          polylines.add(
            Polyline(
              color: AppColors.blue,
              borderColor: AppColors.darkBlue,
              strokeWidth: 4.r,
              borderStrokeWidth: 3.r,
              points: route.points ?? [],
            ),
          );
        }

        return PolylineLayer(
          polylineCulling: true,
          saveLayers: true,
          polylines: polylines,
        );
      },
    );
  }
}
