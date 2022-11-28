import 'package:fbus_mobile_student/app/core/widget/shared.dart';
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
import '../../../core/widget/status_bar.dart';
import '../controllers/select_mode_controller.dart';
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
                Stack(
                  children: [
                    controller.routesPolyline(),
                    controller.selectedRoutePolyline(),
                    // _routes(),
                    // _busStationMarker(),
                    // _currentLocationMarker(),
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

  Widget _bottom() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 0.45.sh,
            ),
            margin: EdgeInsets.only(
              bottom: 15.h,
              left: 15.w,
              right: 15.w,
            ),
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(9.r),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: controller.bottomDetail(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        (() {
                          return controller.selectModeController.canBack()
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder()),
                                  onPressed: () {
                                    controller.selectModeController.back();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.navigate_before,
                                        color: AppColors.white,
                                        size: 20.r,
                                      ),
                                      Text(
                                        'Trở lại',
                                        style: subtitle2.copyWith(
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                )
                              : Container();
                        }),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          controller.selectModeController.next();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Tiếp tục',
                              style: subtitle2.copyWith(color: AppColors.white),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: AppColors.white,
                              size: 20.r,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _routeLineItem(String id) {
  //   return Column(
  //     children: [
  //       Material(
  //         child: InkWell(
  //           onTap: () {
  //             controller.routeController.selectRoute(id);
  //           },
  //           child: Obx(
  //             () {
  //               String? selectedId = controller.routeController.selectedRouteId;
  //               return Container(
  //                 color:
  //                     id == selectedId ? AppColors.gray.withOpacity(0.3) : null,
  //                 padding: EdgeInsets.symmetric(horizontal: 15.w),
  //                 alignment: Alignment.centerLeft,
  //                 width: double.infinity,
  //                 height: 40.h,
  //                 child: Text(
  //                   '${controller.routeController.routes[id]?.title}',
  //                   style: subtitle2.copyWith(
  //                       fontWeight: id == selectedId
  //                           ? FontWeights.medium
  //                           : FontWeights.regular),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 1,
  //       ),
  //     ],
  //   );
  // }

  // Obx _routes() {
  //   return Obx(
  //     () {
  //       return HyperPolylineLayer(
  //         // Will only render visible polylines, increasing performance
  //         polylineCulling: true,
  //         pointerDistanceTolerance: 50,
  //         polylines: controller.routeController.polyline,
  //         onTap: (polylines, tapPosition) {
  //           // debugPrint(
  //           //     'Tapped: ${polylines.map((polyline) => polyline.tag).join(',')} at ${tapPosition.globalPosition}');
  //           // controller.route.selectRoute(polylines.first.tag);
  //         },
  //         onMiss: (tapPosition) {
  //           // debugPrint(
  //           //     'No polyline was tapped at position ${tapPosition.globalPosition}');
  //         },
  //         onDoubleMiss: (tapPosition) {
  //           // debugPrint(
  //           //     'No polyline was double tapped at position ${tapPosition.globalPosition}');
  //           // controller.route.clearAllSelectedRoutes();
  //         },
  //       );
  //     },
  //   );
  // }

  // Obx _busStationMarker() {
  //   return Obx(
  //     () => MarkerLayer(
  //       markers: controller.routeController.stationMarkers,
  //     ),
  //   );
  // }

  // Widget _currentLocationMarker() {
  //   return IgnorePointer(
  //     child: CurrentLocationLayer(
  //       positionStream:
  //           controller.hyperMapController.geolocatorPositionStream(),
  //       style: LocationMarkerStyle(
  //         markerDirection: MarkerDirection.heading,
  //         showHeadingSector: false,
  //         markerSize: Size(60.r, 60.r),
  //         marker: Stack(
  //           children: [
  //             Center(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       offset: const Offset(0, 0),
  //                       blurRadius: 4,
  //                       spreadRadius: 0,
  //                       color: AppColors.black.withOpacity(0.4),
  //                     ),
  //                   ],
  //                 ),
  //                 height: 26.r,
  //                 width: 26.r,
  //                 child: DefaultLocationMarker(
  //                   child: Container(
  //                     padding: EdgeInsets.only(bottom: 2.r),
  //                     child: Center(
  //                       child: Icon(
  //                         Icons.navigation,
  //                         color: Colors.white,
  //                         size: 16.r,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Column _routeSelect() {
  //   return Column(
  //     children: [
  //       Text('Chọn tuyến', style: subtitle2),
  //       SizedBox(
  //         height: 3.h,
  //       ),
  //       const Divider(),
  //       Expanded(
  //         child: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               _routeLineItem('0'),
  //               _routeLineItem('1'),
  //             ],
  //           ),
  //         ),
  //       ),
  //       const Divider(),
  //     ],
  //   );
  // }

  // Column _stationSelect() {
  //   return Column(
  //     children: [
  //       Text('Chọn trạm', style: subtitle2),
  //       SizedBox(
  //         height: 3.h,
  //       ),
  //       const Divider(),
  //       Obx(() => Expanded(
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: controller.routeController.stationItems,
  //               ),
  //             ),
  //           )),
  //       const Divider(),
  //     ],
  //   );
  // }

  // Widget _routeLineItem(String id) {
  //   return Column(
  //     children: [
  //       Material(
  //         child: InkWell(
  //           onTap: () {
  //             controller.routeController.selectRoute(id);
  //           },
  //           child: Obx(
  //             () {
  //               String? selectedId = controller.routeController.selectedRouteId;
  //               return Container(
  //                 color:
  //                     id == selectedId ? AppColors.gray.withOpacity(0.3) : null,
  //                 padding: EdgeInsets.symmetric(horizontal: 15.w),
  //                 alignment: Alignment.centerLeft,
  //                 width: double.infinity,
  //                 height: 40.h,
  //                 child: Text(
  //                   '${controller.routeController.routes[id]?.title}',
  //                   style: subtitle2.copyWith(
  //                       fontWeight: id == selectedId
  //                           ? FontWeights.medium
  //                           : FontWeights.regular),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 1,
  //       ),
  //     ],
  //   );
  // }
}
