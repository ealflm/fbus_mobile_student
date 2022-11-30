import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/widget/status_bar.dart';
import '../controllers/select_trip_controller.dart';

class SelectTripView extends GetView<SelectTripController> {
  const SelectTripView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        body: Column(
          children: [
            controller.calendar(),
            SizedBox(
              height: 10.h,
            ),
            controller.tripList(),
          ],
        ),
      ),
    );
  }
}
