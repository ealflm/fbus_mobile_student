import 'package:fbus_mobile_student/app/modules/select_route/controllers/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hyper_polyline/hyper_polyline.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_svg_assets.dart';
import '../../map/hyper_map_controller.dart';

class SelectRouteController extends GetxController {
  HyperMapController hyperMapController = HyperMapController();

  List<Station> stations = [];
  Rx<List<Marker>> stationMarkers = Rx<List<Marker>>([]);

  Rx<Map<String, HyperPolyline>> routes = Rx<Map<String, HyperPolyline>>({});

  Rx<List<TaggedPolyline>> polylines = Rx<List<TaggedPolyline>>([]);

  @override
  void onInit() {
    updateRoutes();
    updatePolyLines();
    updateStations();
    super.onInit();
  }

  void updateRoutes() {
    routes.update((value) {
      value!.clear();
      value['0'] = HyperPolyline(id: '0', points: getRoutePoints(0));
      value['1'] = HyperPolyline(id: '1', points: getRoutePoints(1));
    });
  }

  void updatePolyLines() {
    polylines.update(
      (value) {
        value!.clear();

        for (var entry in routes.value.entries) {
          var route = routes.value[entry.key];
          if (route != null) {
            if (route.isSelected == false) {
              value.add(
                TaggedPolyline(
                  tag: route
                      .id, // An optional tag to distinguish polylines in `onTap` callback
                  strokeWidth: 5.r,
                  color: route.isSelected == true
                      ? AppColors.blue
                      : AppColors.indicator,
                  borderStrokeWidth: 3.r,
                  borderColor: route.isSelected == true
                      ? AppColors.blue
                      : AppColors.caption,
                  points: route.points,
                ),
              );
            }
          }
        }

        for (var entry in routes.value.entries) {
          var route = routes.value[entry.key];
          if (route != null) {
            if (route.isSelected == true) {
              value.add(
                TaggedPolyline(
                  tag: route
                      .id, // An optional tag to distinguish polylines in `onTap` callback
                  strokeWidth: 5.r,
                  color: route.isSelected == true
                      ? AppColors.blue
                      : AppColors.indicator.withOpacity(0.6),
                  borderStrokeWidth: 3.r,
                  borderColor: route.isSelected == true
                      ? AppColors.blue
                      : AppColors.caption.withOpacity(0.6),
                  points: route.points,
                ),
              );
            }
          }
        }
      },
    );
  }

  void updateStations() {
    stations.add(
      Station(
        routeIds: [routes.value['0']!.id, routes.value['1']!.id],
        title: 'FPT University',
        address:
            'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh',
        location: LatLng(10.841567123475343, 106.80898942710063),
      ),
    );
    stations.add(
      Station(
        routeIds: [routes.value['0']!.id],
        title: 'Vinhomes Grand Park',
        address: 'Nguyễn Xiển, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh',
        location: LatLng(10.845082, 106.812956),
      ),
    );
    stations.add(
      Station(
        routeIds: [routes.value['0']!.id],
        title: '354 Nguyễn Văn Tăng',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.849830, 106.812727),
      ),
    );
    stations.add(
      Station(
        routeIds: [routes.value['0']!.id],
        title: 'Trường ĐH Nguyễn Tất Thành',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.843534, 106.818625),
      ),
    );
    stations.add(
      Station(
        routeIds: [routes.value['0']!.id],
        title: 'Công Ty Mekophar',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.842686, 106.828594),
      ),
    );

    // Another
    stations.add(
      Station(
        routeIds: [routes.value['1']!.id],
        title: 'Công Ty Filied Lê Văn Việt',
        address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
        location: LatLng(10.849322192020587, 106.80087176970181),
      ),
    );
    stations.add(
      Station(
        routeIds: [routes.value['1']!.id],
        title: 'Intel Products Vietnam',
        address:
            'Hi-Tech Park, Lô I2, Đ. D1, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam',
        location: LatLng(10.851058, 106.799028),
      ),
    );
    stations.add(
      Station(
        routeIds: [routes.value['1']!.id],
        title: 'Khu Công nghệ cao TP.HCM',
        address:
            'Phường Tân Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam',
        location: LatLng(10.857539, 106.786016),
      ),
    );

    List<Marker> items = [];
    for (Station station in stations) {
      var item = Marker(
        width: 80.r,
        height: 80.r,
        point: station.location,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20.r),
            child: GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                color: AppColors.white.withOpacity(0),
                padding: EdgeInsets.all(10.r),
                child: Obx(() {
                  bool isHighlight = false;
                  for (String id in station.routeIds ?? []) {
                    if (routes.value[id]?.isSelected == true) {
                      isHighlight = true;
                      break;
                    }
                  }
                  return Opacity(
                    opacity: isHighlight ? 1 : 0.6,
                    child: SvgPicture.asset(
                      AppSvgAssets.busIcon,
                    ),
                  );
                }),
              ),
            ),
          );
        },
      );
      items.add(item);
    }

    stationMarkers(items);
  }

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
    hyperMapController.moveToCurrentLocationWithoutAnimation();
  }

  void selectRoute(String? id) {
    if (id == null) return;
    routes.update((value) {
      for (var entry in value!.entries) {
        value[entry.key]?.isSelected = false;
      }
      value[id]?.isSelected = true;
    });

    updatePolyLines();
  }

  void clearAllSelectRoutes() {
    routes.update((value) {
      for (var entry in routes.value.entries) {
        routes.value[entry.key]?.isSelected = false;
      }
    });

    updatePolyLines();
  }
}

class Station {
  List<String>? routeIds;
  String title;
  String address;
  LatLng location;

  Station(
      {this.routeIds,
      required this.title,
      required this.address,
      required this.location});
}

class HyperPolyline {
  String id;
  bool isSelected;
  List<LatLng> points;

  HyperPolyline(
      {required this.id, required this.points, this.isSelected = false});
}
