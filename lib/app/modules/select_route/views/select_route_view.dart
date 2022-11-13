import 'package:fbus_mobile_student/app/core/widget/hyper_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'package:hyper_polyline/hyper_polyline.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/shared.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/select_route_controller.dart';

class SelectRouteView extends GetView<SelectRouteController> {
  const SelectRouteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: controller.hyperMapController.mapController,
              options: MapOptions(
                interactiveFlags:
                    InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                center: LatLng(10.841411, 106.809936),
                zoom: 9,
                minZoom: 3,
                maxZoom: 18.4,
                slideOnBoundaries: true,
                onMapReady: controller.onMapReady,
              ),
              children: [
                TileLayer(
                  urlTemplate: AppSettings.get('mapboxUrlTemplate'),
                  additionalOptions: {
                    "access_token": AppSettings.get('mapboxAccessToken'),
                  },
                ),
                HyperStack(
                  children: [
                    _routes(),
                    _busStationMarker(),
                    _currentLocationMarker(),
                  ],
                ),
              ],
            ),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Obx _routes() {
    return Obx(
      () {
        return HyperPolylineLayer(
          // Will only render visible polylines, increasing performance
          polylineCulling: true,
          pointerDistanceTolerance: 50,
          polylines: controller.polylines.value,
          onTap: (polylines, tapPosition) {
            debugPrint(
                'Tapped: ${polylines.map((polyline) => polyline.tag).join(',')} at ${tapPosition.globalPosition}');
            controller.selectRoute(polylines.first.tag);
          },
          onMiss: (tapPosition) {
            debugPrint(
                'No polyline was tapped at position ${tapPosition.globalPosition}');
          },
          onDoubleMiss: (tapPosition) {
            debugPrint(
                'No polyline was double tapped at position ${tapPosition.globalPosition}');
            controller.clearAllSelectRoutes();
          },
        );
      },
    );
  }

  Obx _busStationMarker() {
    return Obx(
      () => MarkerLayer(
        markers: controller.stationMarkers.value,
      ),
    );
  }

  Widget _bottom() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15.h, right: 15.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.all(10.r),
                    minimumSize: Size.zero,
                  ),
                  onPressed:
                      controller.hyperMapController.moveToCurrentLocation,
                  child: const Icon(
                    Icons.my_location,
                    color: AppColors.lightBlack,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: 15.h,
              left: 15.w,
              right: 15.w,
            ),
            padding: EdgeInsets.only(
              top: 15.h,
              bottom: 15.h,
              left: 18.w,
              right: 18.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(9.r),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Khoảng cách',
                          style: body2.copyWith(color: AppColors.lightBlack),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '0',
                            style: h4.copyWith(fontWeight: FontWeights.medium),
                            children: [
                              TextSpan(
                                text: 'km',
                                style: h6.copyWith(
                                    fontWeight: FontWeights.regular),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.h),
                        RichText(
                          text: TextSpan(
                            text: 'Thời gian: ',
                            style: body2.copyWith(color: AppColors.lightBlack),
                            children: [
                              TextSpan(
                                text: '0 phút',
                                style: subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      // onPressed: () {
                      //   Get.toNamed(Routes.SCAN);
                      // },
                      onPressed: null,
                      child: Row(
                        children: [
                          Text(
                            'Tiếp tục',
                            style: subtitle2,
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: AppColors.softBlack,
                            size: 20.r,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    selectStation(
                      // title: 'Vinhomes grand park',
                      secondTitle: 'Chưa chọn trạm đi',
                      iconColor: AppColors.green,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 11.r),
                      child: Column(
                        children: [
                          SizedBox(height: 5.h),
                          dot(),
                          SizedBox(height: 5.h),
                          dot(),
                          SizedBox(height: 5.h),
                          dot(),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                    selectStation(
                      // title: 'FPT University',
                      secondTitle: 'Chưa chọn trạm đến',
                      iconColor: AppColors.secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CurrentLocationLayer _currentLocationMarker() {
    return CurrentLocationLayer(
      positionStream: controller.hyperMapController.geolocatorPositionStream(),
      style: LocationMarkerStyle(
        markerDirection: MarkerDirection.heading,
        showHeadingSector: false,
        markerSize: Size(60.r, 60.r),
        marker: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                  ],
                ),
                height: 26.r,
                width: 26.r,
                child: DefaultLocationMarker(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 2.r),
                    child: Center(
                      child: Icon(
                        Icons.navigation,
                        color: Colors.white,
                        size: 16.r,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
