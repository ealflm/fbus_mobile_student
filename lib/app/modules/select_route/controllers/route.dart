import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:fbus_mobile_student/app/modules/select_route/controllers/route_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyper_polyline/hyper_polyline.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_svg_assets.dart';
import '../../../core/values/text_styles.dart';

class Route {
  final Rx<Map<String, HyperPolyline>> _routes =
      Rx<Map<String, HyperPolyline>>({});
  final Rx<List<TaggedPolyline>> _polylines = Rx<List<TaggedPolyline>>([]);
  final Map<String, Station> _stations = {};
  final Rx<List<Marker>> _stationMarkers = Rx<List<Marker>>([]);
  final Rx<String?> _selectedRouteId = Rx<String?>(null);
  final Rx<String?> _selectedStationId = Rx<String?>(null);
  final Rx<String?> _autoSelectedStationId = Rx<String?>(null);

  List<Marker> get stationMarkers => _stationMarkers.value;
  List<TaggedPolyline> get polyline => _polylines.value;
  String? get selectedRouteId => _selectedRouteId.value;
  HyperPolyline? get selectedRoute {
    if (selectedRouteId != null && _routes.value.containsKey(selectedRouteId)) {
      return _routes.value[selectedRouteId];
    } else {
      return null;
    }
  }

  String? get selectedStationId => _selectedStationId.value;
  Station? get selectedStation {
    if (selectedStationId != null && _stations.containsKey(selectedRouteId)) {
      return _stations[selectedStationId];
    } else {
      return null;
    }
  }

  String? get autoSelectedStationId => _autoSelectedStationId.value;
  Station? get autoSelectedStation {
    if (autoSelectedStationId != null &&
        _stations.containsKey(autoSelectedStationId)) {
      return _stations[autoSelectedStationId];
    } else {
      return null;
    }
  }

  Route() {
    updateRoutes();
    updatePolyLines();
    updateStations();
    updateStationMarkers();
  }

  void updateRoutes() {
    _routes.update((value) {
      value!.clear();
      value['0'] = HyperPolyline(
          id: '0',
          points: getRoutePoints(0),
          stationIds: ['0', '1', '2', '3', '4']);
      value['1'] = HyperPolyline(
          id: '1', points: getRoutePoints(1), stationIds: ['0', '5', '6', '7']);
    });
  }

  void selectRoute(String? id) {
    if (id == null) return;

    _selectedRouteId.value = id;

    _selectedStationId.value = null;
    List<String> showedStationIds = selectedRoute?.stationIds ?? [];
    if (showedStationIds.isNotEmpty) {
      _autoSelectedStationId.value = showedStationIds.first;
    }

    updatePolyLines();
    updateStationMarkers();
  }

  void clearAllSelectedRoutes() {
    _selectedRouteId.value = null;

    _selectedStationId.value = null;
    _autoSelectedStationId.value = null;

    updatePolyLines();
    updateStationMarkers();
  }

  void updatePolyLines() {
    _polylines.update(
      (value) {
        value!.clear();

        for (var entry in _routes.value.entries) {
          var route = _routes.value[entry.key];
          if (route != null) {
            if (route.id != selectedRouteId) {
              value.add(
                TaggedPolyline(
                  tag: route
                      .id, // An optional tag to distinguish polylines in `onTap` callback
                  strokeWidth: 5.r,
                  color: AppColors.indicator,
                  borderStrokeWidth: 3.r,
                  borderColor: AppColors.caption,
                  points: route.points,
                ),
              );
            }
          }
        }

        if (selectedRoute != null) {
          value.add(
            TaggedPolyline(
              tag: selectedRoute
                  ?.id, // An optional tag to distinguish polylines in `onTap` callback
              strokeWidth: 5.r,
              color: AppColors.blue,
              borderStrokeWidth: 3.r,
              borderColor: AppColors.blue,
              points: selectedRoute?.points,
            ),
          );
        }
      },
    );
  }

  void updateStations() {
    _stations['0'] = Station(
      id: '0',
      title: 'FPT University',
      address:
          'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh',
      location: LatLng(10.841567123475343, 106.80898942710063),
    );
    _stations['1'] = Station(
      id: '1',
      title: 'Vinhomes Grand Park',
      address: 'Nguyễn Xiển, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh',
      location: LatLng(10.845082, 106.812956),
    );
    _stations['2'] = Station(
      id: '2',
      title: '354 Nguyễn Văn Tăng',
      address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
      location: LatLng(10.849830, 106.812727),
    );
    _stations['3'] = Station(
      id: '3',
      title: 'Trường ĐH Nguyễn Tất Thành',
      address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
      location: LatLng(10.843534, 106.818625),
    );
    _stations['4'] = Station(
      id: '4',
      title: 'Công Ty Mekophar',
      address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
      location: LatLng(10.842686, 106.828594),
    );

    // Another
    _stations['5'] = Station(
      id: '5',
      title: 'Công Ty Filied Lê Văn Việt',
      address: 'Long Thạnh Mỹ, District 9, Ho Chi Minh City, Vietnam',
      location: LatLng(10.849322192020587, 106.80087176970181),
    );
    _stations['6'] = Station(
      id: '6',
      title: 'Intel Products Vietnam',
      address:
          'Hi-Tech Park, Lô I2, Đ. D1, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam',
      location: LatLng(10.851058, 106.799028),
    );
    _stations['7'] = Station(
      id: '7',
      title: 'Khu Công nghệ cao TP.HCM',
      address:
          'Phường Tân Phú, Thành phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam',
      location: LatLng(10.857539, 106.786016),
    );
  }

  void selectStationMarker(String id) {
    _selectedStationId.value = id;
    updateStationMarkers();
  }

  void updateStationMarkers() {
    List<Marker> items = [];
    List<Marker> topItems = [];

    List<String> showedStationIds = selectedRoute?.stationIds ?? [];
    for (Station station in _stations.values) {
      StationMarkerState state = StationMarkerState.hide;

      if (station.id == _selectedStationId.value) {
        state = StationMarkerState.to;
      } else if (station.id == _autoSelectedStationId.value) {
        state = StationMarkerState.from;
      } else if (showedStationIds.contains(station.id)) {
        state = StationMarkerState.show;
      }

      Marker item;
      if (state == StationMarkerState.show ||
          state == StationMarkerState.hide) {
        item = Marker(
          width: 80.r,
          height: 80.r,
          point: station.location,
          builder: (context) {
            return state == StationMarkerState.show
                ? Container(
                    padding: EdgeInsets.all(20.r),
                    child: GestureDetector(
                      onTap: () {
                        selectStationMarker(station.id);
                      },
                      child: Container(
                        color: AppColors.white.withOpacity(0),
                        padding: EdgeInsets.all(10.r),
                        child: Opacity(
                          opacity: state == StationMarkerState.show ? 1 : 0.6,
                          child: SvgPicture.asset(
                            AppSvgAssets.busIcon,
                          ),
                        ),
                      ),
                    ),
                  )
                : IgnorePointer(
                    child: Container(
                      padding: EdgeInsets.all(20.r),
                      child: Container(
                        color: AppColors.white.withOpacity(0),
                        padding: EdgeInsets.all(10.r),
                        child: Opacity(
                          opacity: state == StationMarkerState.show ? 1 : 0.6,
                          child: SvgPicture.asset(
                            AppSvgAssets.busIcon,
                          ),
                        ),
                      ),
                    ),
                  );
          },
        );
        items.add(item);
      } else {
        item = Marker(
          width: 200.r,
          height: 90.r,
          point: station.location,
          builder: (context) {
            return IgnorePointer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: AppColors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Text(
                      station.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: body2.copyWith(
                        color: AppColors.softBlack,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SvgPicture.asset(
                    state == StationMarkerState.from
                        ? AppSvgAssets.busIconFrom
                        : AppSvgAssets.busIconTo,
                    height: 25.r,
                    width: 25.r,
                  ),
                ],
              ),
            );
          },
        );
        topItems.add(item);
      }
    }

    _stationMarkers(items + topItems);
  }
}

enum StationMarkerState { hide, show, from, to }

class Station {
  String id;
  String title;
  String address;
  LatLng location;

  Station({
    required this.id,
    required this.title,
    required this.address,
    required this.location,
  });
}

class HyperPolyline {
  String id;
  List<String>? stationIds;
  List<LatLng> points;

  HyperPolyline(
      {required this.id, required this.points, required this.stationIds});
}
