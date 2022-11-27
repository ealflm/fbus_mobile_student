import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyper_polyline/hyper_polyline.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_svg_assets.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../data/local/db/route_data.dart';
import '../../../data/local/db/station_data.dart';
import '../../../data/models/route_model.dart';
import '../../../data/models/station_model.dart';

class RouteController {
  final Rx<Map<String, Route>> _routes = Rx<Map<String, Route>>({});
  final Rx<List<TaggedPolyline>> _polylines = Rx<List<TaggedPolyline>>([]);
  Map<String, Station> _stations = {};
  final Rx<List<Marker>> _stationMarkers = Rx<List<Marker>>([]);
  final Rx<List<Widget>> _stationItems = Rx<List<Widget>>([]);
  final Rx<String?> _selectedRouteId = Rx<String?>(null);
  final Rx<String?> _selectedStationId = Rx<String?>(null);
  final Rx<String?> _autoSelectedStationId = Rx<String?>(null);

  Map<String, Route> get routes => _routes.value;
  Map<String, Station> get stations => _stations;

  List<Marker> get stationMarkers => _stationMarkers.value;
  List<Widget> get stationItems => _stationItems.value;
  List<TaggedPolyline> get polyline => _polylines.value;
  String? get selectedRouteId => _selectedRouteId.value;
  Route? get selectedRoute {
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

  RouteController() {
    updateRoutes();
    updatePolyLines();
    updateStations();
    updateStationMarkers();
  }

  void updateStationItems() {
    List<Widget> result = [];
    for (Station station in _stations.values) {
      if (selectedRoute?.stationIds?.contains(station.id) ?? false) {
        result.add(stationLineItem(station.id));
      }
    }
    _stationItems(result);
  }

  Widget stationLineItem(String id) {
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: () {
              selectStation(id);
            },
            child: Obx(
              () {
                String? selectedId = selectedStationId;
                return Container(
                  color:
                      id == selectedId ? AppColors.gray.withOpacity(0.3) : null,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 40.h,
                  child: Text(
                    '${stations[id]?.title}',
                    style: subtitle2.copyWith(
                        fontWeight: id == selectedId
                            ? FontWeights.medium
                            : FontWeights.regular),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 1,
        ),
      ],
    );
  }

  void updateRoutes() {
    _routes.value = getRoutes();
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
    _stations = getStations();
  }

  void selectStation(String id) {
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
                        // selectStationMarker(station.id);
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
