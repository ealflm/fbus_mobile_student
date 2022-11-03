import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/tab_views/Used_view.dart';
import '../views/tab_views/booked_view.dart';
import '../views/tab_views/canceled_view.dart';

class TicketController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final tabs = [
    const Tab(text: 'Đã đặt'),
    const Tab(text: 'Đã huỷ'),
    const Tab(text: 'Đã sử dụng'),
  ];

  Rx<int> tabIndex = 0.obs;
  final List<Widget> screens = [
    const BookedView(),
    const CanceledView(),
    const UsedView(),
  ];

  void changeTab(int index) {
    tabController.index = index;
    tabIndex.value = index;
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
