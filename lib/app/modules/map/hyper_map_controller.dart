import 'package:fbus_mobile_student/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HyperMapController extends GetxController
    with GetTickerProviderStateMixin {
  MapController controller = MapController();
  LatLng? currentLocation;

  /// Moving to current location.
  void moveToCurrentLocation() {
    if (currentLocation != null) {
      _animatedMapMove(currentLocation!, zoom: AppValues.focusZoomLevel);
    } else {
      debugPrint('Current location is invalid');
    }
  }

  /// Moving to [location] with animation.
  void _animatedMapMove(LatLng location, {double? zoom}) {
    final latTween = Tween<double>(
        begin: controller.center.latitude, end: location.latitude);
    final lngTween = Tween<double>(
        begin: controller.center.longitude, end: location.longitude);
    final zoomTween =
        Tween<double>(begin: controller.zoom, end: zoom ?? controller.zoom);

    var animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    Animation<double> animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    animationController.addListener(() {
      try {
        controller.move(
            LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
            zoomTween.evaluate(animation));
      } catch (e) {
        animationController.dispose();
        return;
      }
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.dispose();
      } else if (status == AnimationStatus.dismissed) {
        animationController.dispose();
      }
    });

    animationController.forward();
  }
}
