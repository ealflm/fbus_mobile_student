import 'package:fbus_mobile_student/app/modules/ticket/controllers/ticket_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widget/ticket_item.dart';
import '../../../data/models/student_trip_model.dart';
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

  TicketDataService ticketDataService = TicketDataService();

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    ticketDataService.fetchTickets();
    super.onInit();
  }

  Widget ticketList() {
    return Obx(
      () {
        List<Widget> ticketList = [];

        for (Ticket ticket in ticketDataService.tickets ?? []) {
          ticketList.add(ticketItem(ticket));
          ticketList.add(SizedBox(
            height: 10.h,
          ));
        }

        return Column(
          children: ticketList,
        );
      },
    );
  }

  Widget ticketItem(Ticket ticket) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: TicketItem(
        ticket: ticket,
        state: TicketItemExpandedState.less,
        backgroundColor: AppColors.white,
        textColor: AppColors.softBlack,
        onPressed: () {
          // Get to
        },
      ),
    );
  }
}
