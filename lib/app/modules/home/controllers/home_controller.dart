import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void onPositionChanged(MapPosition postion, bool hasGesture) {
    debugPrint('${postion.zoom}');
  }
}
