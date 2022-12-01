import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widget/ticket_item.dart';
import '../../../data/models/student_trip_model.dart';
import 'home_ticket_data_service.dart';

class HomeController extends GetxController {
  HomeTicketDataService ticketDataService = Get.find<HomeTicketDataService>();

  Widget currentTicket() {
    return Obx(
      () {
        if (ticketDataService.ticket == null) return Container();
        Ticket ticket = ticketDataService.ticket!;
        return Column(
          children: [
            ticketItem(
              ticket,
              title: ticket.status == 1 ? 'Chuyến đi gần nhất' : 'Đang diễn ra',
              backgroundColor:
                  ticket.status == 1 ? AppColors.purple500 : AppColors.green,
              textColor: ticket.status == 1 ? AppColors.white : AppColors.white,
            ),
            SizedBox(height: 15.h),
          ],
        );
      },
    );
  }

  Widget ticketItem(
    Ticket ticket, {
    String title = '',
    Color backgroundColor = AppColors.white,
    Color textColor = AppColors.softBlack,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: TicketItem(
        title: title,
        ticket: ticket,
        state: TicketItemExpandedState.less,
        backgroundColor: backgroundColor,
        textColor: textColor,
        onPressed: () {
          // Get to
        },
      ),
    );
  }
}
