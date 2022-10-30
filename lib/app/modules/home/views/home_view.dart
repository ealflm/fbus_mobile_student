import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'package:latlong2/latlong.dart';

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
          ],
        ),
      ),
    );
  }
}
