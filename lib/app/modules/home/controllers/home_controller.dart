import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widget/ticket_item.dart';
import '../../../data/models/student_trip_model.dart';
import 'ticket_data_service.dart';

class HomeController extends GetxController {
  TicketDataService ticketDataService = TicketDataService();

  @override
  void onInit() {
    ticketDataService.fetchTicket();
    super.onInit();
  }

  Widget currentTickets() {
    return Obx(
      () {
        if (ticketDataService.ticket == null) return Container();
        Ticket ticket = ticketDataService.ticket!;
        return ticketItem(
            ticket, ticket.status == 1 ? 'Chuyến đi sắp tới' : 'Đang diễn ra');
      },
    );
  }

  Widget ticketItem(Ticket ticket, String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: TicketItem(
        title: title,
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
