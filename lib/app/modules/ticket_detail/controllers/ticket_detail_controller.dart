import 'package:fbus_mobile_student/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/shared.dart';
import '../../../core/widget/ticket_item.dart';
import '../../../data/models/student_trip_model.dart';
import '../../home/controllers/home_ticket_data_service.dart';
import '../../map/hyper_map_controller.dart';

class TicketDetailController extends GetxController {
  final Rx<Ticket?> _ticket = Rx<Ticket?>(null);
  Ticket? get ticket => _ticket.value;
  set ticket(Ticket? value) {
    _ticket.value = value;
  }

  HyperMapController hyperMapController = HyperMapController();

  @override
  void onInit() {
    Map<String, dynamic> arg = {};
    if (Get.arguments != null) {
      arg = Get.arguments as Map<String, dynamic>;
    }
    if (arg.containsKey('ticket')) {
      ticket = arg['ticket'];
    } else {
      showToast('Đã có lỗi xảy ra');
      Get.back();
    }
    super.onInit();
  }

  void onMapReady() async {
    await hyperMapController.refreshCurrentLocation();
  }

  HomeTicketDataService homeTicketDataService =
      Get.find<HomeTicketDataService>();

  Widget ticketDetail() {
    return Obx((() {
      return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 20.h),
        child: ticketItem(''),
      );
    }));
  }

  Widget ticketItem(String title) {
    Color backgroundColor = AppColors.white;
    Color textColor = AppColors.softBlack;
    Ticket? currentTicket = homeTicketDataService.ticket;

    if (currentTicket?.id == ticket?.id) {
      if (ticket?.status == 2) {
        backgroundColor = AppColors.green;
        textColor = AppColors.white;
        title = 'Đang diễn ra';
      } else {
        backgroundColor = AppColors.purple500;
        textColor = AppColors.white;
        title = 'Chuyến đi gần nhất';
      }
    }

    if (ticket?.isPassed == true) {
      backgroundColor = AppColors.caption;
      textColor = AppColors.white;
      title = 'Đã sử dụng';
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: TicketItem(
        title: title,
        ticket: ticket!,
        state: TicketItemExpandedState.more,
        backgroundColor: backgroundColor,
        textColor: textColor,
        expandedBackgroundColor: backgroundColor,
        expandedTextColor: textColor,
        button: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          onPressed: ticket?.isPassed == true ? () {} : null,
          child: Text(
            'Đánh giá',
            style: subtitle2.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
