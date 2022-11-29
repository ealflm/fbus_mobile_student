import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_trip_controller.dart';

class SelectTripView extends GetView<SelectTripController> {
  const SelectTripView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectTripView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SelectTripView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
