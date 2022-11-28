import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../map/hyper_map_controller.dart';
import 'route_data_service.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();
  RouteDataService routeDataService = Get.put(RouteDataService());

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
              color: AppColors.caption,
              borderColor: AppColors.description,
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

  Widget selectedRoutePolyline() {
    return Obx(
      () {
        return PolylineLayer(
          polylineCulling: true,
          saveLayers: true,
          polylines: [
            Polyline(
              color: AppColors.blue,
              borderColor: AppColors.darkBlue,
              strokeWidth: 4.r,
              borderStrokeWidth: 3.r,
              points: routeDataService.selectedRoute?.points ?? [],
            ),
          ],
        );
      },
    );
  }

  Widget routeSelectList() {
    return Obx(
      () {
        List<Widget> lines = [];

        for (var route in routeDataService.routes.values) {
          lines.add(
            Column(
              children: [
                Material(
                  child: InkWell(
                    onTap: () {
                      routeDataService.selectRoute(route.id);
                    },
                    child: Container(
                      color: route.id == routeDataService.selectedRouteId
                          ? AppColors.gray.withOpacity(0.3)
                          : null,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 40.h,
                      child: Text(
                        '${route.name}',
                        style: subtitle2.copyWith(
                            fontWeight:
                                route.id == routeDataService.selectedRouteId
                                    ? FontWeights.medium
                                    : FontWeights.regular),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: lines,
        );
      },
    );
  }
}
