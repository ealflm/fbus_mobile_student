import 'package:fbus_mobile_student/app/core/widget/unfocus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
                _currentLocationMarker(),
              ],
            ),
            _top(),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: 15.h,
          left: 15.w,
          right: 15.w,
        ),
        alignment: Alignment.topCenter,
        child: PhysicalModel(
          borderRadius: BorderRadius.circular(50.r),
          color: Colors.white,
          elevation: 2,
          child: Container(
            height: 42.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: AppColors.surface,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                errorStyle: caption,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                hintText: 'Tìm kiếm',
                prefixIcon: SizedBox(
                  height: 22.w,
                  width: 22.w,
                  child: Icon(
                    Icons.search,
                    size: 22.r,
                    color: AppColors.lightBlack,
                  ),
                ),
                hintStyle: subtitle1.copyWith(
                  color: AppColors.description,
                ),
              ),
            ),
          ),
        ),
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
              left: 15.w,
              right: 15.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary600,
              borderRadius: BorderRadius.all(
                Radius.circular(9.r),
              ),
            ),
            child: Text(
              'FPT University - Vinhomes Grand Park',
              style: subtitle2,
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
