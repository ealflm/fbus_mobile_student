import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../home/views/home_view.dart';
import '../../notification/views/notification_view.dart';
import '../../ticket/views/ticket_view.dart';

class MainController extends GetxController {
  var currentTab = 0.obs;
  final List<Widget> screens = [
    const HomeView(),
    const TicketView(),
    const NotificationView(),
    const AccountView(),
  ];

  void changeTab(int index) {
    currentTab.value = index;
  }
}
