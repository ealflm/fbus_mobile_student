import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/notification_controller.dart';
import '../widgets/transaction_item.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 18.w,
                        top: 10.h,
                        right: 18.w,
                      ),
                      child: Text(
                        'Thông báo',
                        style: h5.copyWith(color: AppColors.softBlack),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                controller.notifications.value.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: controller.notifications.value.length,
                            itemBuilder: (context, index) {
                              var item = controller.notifications.value[index];
                              if (item.filter == 0) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 18.w, right: 18.w, top: 10.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Hôm nay',
                                            style: h6.copyWith(
                                                color: AppColors.softBlack,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    NotificationItem(
                                      model: item,
                                    ),
                                  ],
                                );
                              } else if (item.filter == 1) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 18.w, right: 18.w, top: 10.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Trước đó',
                                            style: h6.copyWith(
                                                color: AppColors.softBlack,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    NotificationItem(
                                      model: item,
                                    ),
                                  ],
                                );
                              }
                              return NotificationItem(
                                model: item,
                              );
                            }),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Text(
                              'Không có thông báo',
                              style: body2.copyWith(
                                color: AppColors.description,
                              ),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
