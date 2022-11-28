import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/utils/map_utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../data/models/station_model.dart';
import '../../map/hyper_map_controller.dart';
import 'route_data_service.dart';
import 'select_mode_controller.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();
  RouteDataService routeDataService = RouteDataService();
  SelectModeController selectModeController = SelectModeController();

  @override
  void onInit() async {
    await routeDataService.fetchRoutes();
    moveScreenToSelectedRoute();
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
        List<LatLng> points = routeDataService.selectedRoute?.points ?? [];

        if (points.isEmpty) return Container();

        return PolylineLayer(
          polylineCulling: true,
          saveLayers: true,
          polylines: [
            Polyline(
              color: AppColors.blue,
              borderColor: AppColors.darkBlue,
              strokeWidth: 4.r,
              borderStrokeWidth: 3.r,
              points: points,
            ),
          ],
        );
      },
    );
  }

  Widget stationMarker() {
    return Obx(
      () {
        List<Marker> markers = [];

        for (Station station in routeDataService.stations.values) {
          // markers.add();
        }

        return MarkerLayer(
          markers: markers,
        );
      },
    );
  }

  Widget routeSelect() {
    return Obx(
      () {
        List<Widget> lines = [];

        for (var route in routeDataService.routes.values) {
          lines.add(
            selectItem(
              name: route.name,
              isSelected: route.id == routeDataService.selectedRouteId,
              onPressed: () {
                routeDataService.selectRoute(route.id);
                moveScreenToSelectedRoute();
              },
            ),
          );
        }

        return Column(
          children: [
            Text('Chọn tuyến', style: subtitle2),
            SizedBox(
              height: 3.h,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: lines,
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget stationSelect() {
    return Obx(
      () {
        List<Widget> lines = [];

        for (Station station
            in routeDataService.selectedRoute?.stations ?? []) {
          lines.add(
            selectItem(
              name: station.name,
              isSelected: station.id == routeDataService.selectedStationId,
              onPressed: () {
                routeDataService.selectStation(station.id);
                moveScreenToSelectedStation();
              },
            ),
          );
        }

        return Column(
          children: [
            Text('Chọn trạm', style: subtitle2),
            SizedBox(
              height: 3.h,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: lines,
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget selectItem({
    Function()? onPressed,
    bool isSelected = false,
    String? name,
  }) {
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: onPressed,
            child: Container(
              color: isSelected ? AppColors.gray.withOpacity(0.3) : null,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 40.h,
              child: Text(
                '$name',
                style: subtitle2.copyWith(
                    fontWeight:
                        isSelected ? FontWeights.medium : FontWeights.regular),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 1,
        ),
      ],
    );
  }

  Widget bottomDetail() {
    return Obx(
      (() {
        return selectModeController.mode == SelectMode.route
            ? routeSelect()
            : stationSelect();
      }),
    );
  }

  void moveScreenToSelectedRoute() {
    List<LatLng> points = routeDataService.selectedRoute?.points ?? [];

    if (points.isNotEmpty) {
      var bounds = LatLngBounds();
      for (LatLng point in points) {
        bounds.extend(point);
      }

      bounds = MapUtils.padTop(bounds, 0.3, 1.5);

      hyperMapController.centerZoomFitBounds(bounds);
    }
  }

  void moveScreenToSelectedStation() {
    Station? station = routeDataService.selectedStation;

    if (station != null && station.location != null) {
      var bounds = LatLngBounds();
      bounds.extend(station.location!);

      bounds = MapUtils.padTop(bounds, 0.3, 1.5);
      hyperMapController.centerZoomFitBounds(bounds,
          zoom: AppValues.focusZoomLevel);
    }
  }
}
