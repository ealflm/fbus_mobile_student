import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        body: FlutterMap(
          mapController: controller.hyperMapController.mapController,
          options: MapOptions(
            interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
            center: LatLng(10.841411, 106.809936),
            zoom: 13.6,
            minZoom: 3,
            maxZoom: 18.4,
            slideOnBoundaries: true,
          ),
          children: [
            TileLayer(
              urlTemplate: AppSettings.get('mapboxUrlTemplate'),
              additionalOptions: {
                "access_token": AppSettings.get('mapboxAccessToken'),
              },
            ),
            _currentLocationMarker(),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                ),
                onPressed: controller.hyperMapController.moveToCurrentLocation,
                child: Text('Center'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CurrentLocationLayer _currentLocationMarker() {
    return CurrentLocationLayer(
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
