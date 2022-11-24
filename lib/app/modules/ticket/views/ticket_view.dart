import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/ticket_controller.dart';

class TicketView extends GetView<TicketController> {
  const TicketView({Key? key}) : super(key: key);
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
                _header(),
                SizedBox(height: 8.h),
                Expanded(
                  child: Obx(
                    () => IndexedStack(
                      index: controller.tabIndex.value,
                      children: controller.screens,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                'Vé của tôi',
                style: h5.copyWith(color: AppColors.softBlack),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 32.h,
          width: 327.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: TabBar(
            controller: controller.tabController,
            onTap: (index) {
              controller.changeTab(index);
            },
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: AppColors.primary400,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  color: AppColors.primary400.withOpacity(0.4),
                ),
              ],
            ),
            labelColor: AppColors.lightBlack,
            unselectedLabelColor: AppColors.description,
            tabs: controller.tabs,
          ),
        ),
      ],
    );
  }
}

Container ticket({
  Color backgroundColor = AppColors.green,
  Color primaryColor = AppColors.white,
}) {
  return Container(
    padding: EdgeInsets.only(left: 15.w, right: 15.w),
    margin: EdgeInsets.only(bottom: 10.h),
    alignment: Alignment.bottomCenter,
    child: Wrap(
      children: [
        Container(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h, top: 10.h),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(9.r),
            ),
            boxShadow: kElevationToShadow[1],
          ),
          child: Column(
            children: [
              Text(
                '20/11/2022',
                style: subtitle2.copyWith(
                  fontWeight: FontWeights.light,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        station(
                          title: 'Vinhomes grand park',
                          time: '07:00',
                          iconColor: primaryColor,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 11.r),
                          child: Column(
                            children: [
                              dot(),
                              SizedBox(height: 3.h),
                              dot(),
                              SizedBox(height: 3.h),
                              dot(),
                              SizedBox(height: 3.h),
                            ],
                          ),
                        ),
                        station(
                          title: 'FPT University',
                          time: '07:35',
                          iconColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Khoảng cách',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeights.regular,
                              letterSpacing: 0.0025.sp,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '20',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeights.medium,
                                letterSpacing: 0.0025.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'km',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeights.medium,
                                    letterSpacing: 0.0025.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          RichText(
                            text: TextSpan(
                              text: 'Thời gian: ',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeights.regular,
                                letterSpacing: 0.0025.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: '15 phút',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeights.medium,
                                    letterSpacing: 0.0025.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container dot({Color color = AppColors.white}) {
  return Container(
    width: 2.r,
    height: 2.r,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}

Row station(
    {required String title,
    required String time,
    Color? iconColor,
    Color color = AppColors.white}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: kElevationToShadow[1],
        ),
        child: Icon(
          Icons.directions_bus,
          color: iconColor,
          size: 15.r,
        ),
      ),
      SizedBox(
        width: 8.w,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 13.sp,
                fontWeight: FontWeights.medium,
                letterSpacing: 0.0015.sp,
              ),
            ),
            Text(
              time,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 13.sp,
                letterSpacing: 0.0015.sp,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
