import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/ticket_itemz.dart';
import '../../../../data/models/ticket_model.dart';
import '../../controllers/ticket_controller.dart';

class CanceledView extends GetView<TicketController> {
  const CanceledView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            TicketItemZ(
              title: 'Đã huỷ',
              model: TicketModel(
                startStation: 'FPT University',
                endStation: 'Vimhomes grand park',
                startTime: DateTime.now(),
                endTime: DateTime.now().add(const Duration(hours: 1)),
                distance: 15,
                estimatedTime: const Duration(minutes: 30),
              ),
              backgroundColor: AppColors.yellow,
              textColor: AppColors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            TicketItemZ(
              title: 'Đã huỷ',
              model: TicketModel(
                startStation: 'FPT University',
                endStation: 'Vimhomes grand park',
                startTime: DateTime.now(),
                endTime: DateTime.now().add(const Duration(hours: 1)),
                distance: 15,
                estimatedTime: const Duration(minutes: 30),
              ),
              backgroundColor: AppColors.yellow,
              textColor: AppColors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            TicketItemZ(
              title: 'Đã huỷ',
              model: TicketModel(
                startStation: 'FPT University',
                endStation: 'Vimhomes grand park',
                startTime: DateTime.now(),
                endTime: DateTime.now().add(const Duration(hours: 1)),
                distance: 15,
                estimatedTime: const Duration(minutes: 30),
              ),
              backgroundColor: AppColors.yellow,
              textColor: AppColors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            TicketItemZ(
              title: 'Đã huỷ',
              model: TicketModel(
                startStation: 'FPT University',
                endStation: 'Vimhomes grand park',
                startTime: DateTime.now(),
                endTime: DateTime.now().add(const Duration(hours: 1)),
                distance: 15,
                estimatedTime: const Duration(minutes: 30),
              ),
              backgroundColor: AppColors.yellow,
              textColor: AppColors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
