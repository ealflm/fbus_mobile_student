import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../booking/views/booking_view.dart';
import '../../home/views/home_view.dart';
import '../../ticket/views/ticket_view.dart';

class MainController extends GetxController {
  var currentTab = 0.obs;
  final List<Widget> _screens = [
    const HomeView(),
    const TicketView(),
    const BookingView(),
    const AccountView(),
  ];

  PageStorageBucket bucket = PageStorageBucket();
  Widget get currentScreen => _screens[currentTab.value];

  void changeTab(int index) {
    currentTab.value = index;
  }
}
