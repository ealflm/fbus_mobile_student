import 'package:fbus_mobile_student/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/values/font_weights.dart';
import '../../../core/widget/shared.dart';
import '../../../core/widget/status_bar.dart';
import '../../../routes/app_pages.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.SELECT_ROUTE);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: SfCalendar(
            controller: controller.calendarController,
            showDatePickerButton: true,
            allowedViews: controller.allowedViews,
            view: CalendarView.schedule,
            firstDayOfWeek: 1,
            specialRegions: controller.getTimeRegions(),
            scheduleViewMonthHeaderBuilder:
                controller.scheduleViewMonthHeaderBuilder,
            scheduleViewSettings: const ScheduleViewSettings(
              appointmentItemHeight: 111,
              // hideEmptyScheduleWeek: true,
              weekHeaderSettings: WeekHeaderSettings(
                startDateFormat: 'dd/MM',
                endDateFormat: 'dd/MM',
              ),
            ),
            dataSource: getCalendarDataSource(),
            appointmentBuilder:
                (BuildContext context, CalendarAppointmentDetails details) {
              final Appointment appointment = details.appointments.first;
              if (controller.calendarController.view == CalendarView.schedule) {
                return Material(
                  child: InkWell(
                    onTap: () {
                      debugPrint('Hello');
                    },
                    child: Ink(
                      padding: EdgeInsets.all(10.r),
                      color: appointment.color,
                      height: details.bounds.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _station(
                                        title: 'Vinhomes grand park',
                                        time: '07:00',
                                        iconColor: AppColors.green,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 11.r),
                                        child: Column(
                                          children: [
                                            _dot(),
                                            SizedBox(height: 3.h),
                                            _dot(),
                                            SizedBox(height: 3.h),
                                            _dot(),
                                            SizedBox(height: 3.h),
                                          ],
                                        ),
                                      ),
                                      _station(
                                        title: 'FPT University',
                                        time: '07:35',
                                        iconColor: AppColors.secondary,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Khoảng cách',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeights.regular,
                                            letterSpacing: 0.0025.sp,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: '20',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeights.medium,
                                              letterSpacing: 0.0025.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'km',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                      FontWeights.medium,
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
                                              color: AppColors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeights.regular,
                                              letterSpacing: 0.0025.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '15 phút',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeights.medium,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (controller.calendarController.view == CalendarView.day) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  color: appointment.color,
                  height: details.bounds.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Vinhomes grand park - FPT University',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeights.medium,
                                  letterSpacing: 0.0025.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '30km',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeights.bold,
                                letterSpacing: 0.0025.sp,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (controller.calendarController.view == CalendarView.week) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  color: appointment.color,
                  height: details.bounds.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Vinhomes grand park - FPT University',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeights.medium,
                                  letterSpacing: 0.0025.sp,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 5.w,
                            // ),
                            // Text(
                            //   '30km',
                            //   style: TextStyle(
                            //     color: AppColors.white,
                            //     fontSize: 9.sp,
                            //     fontWeight: FontWeights.medium,
                            //     letterSpacing: 0.0025.sp,
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Text(appointment.subject);
            },
          ),
        ),
      ),
    );
  }

  Container _dot() {
    return Container(
      width: 2.r,
      height: 2.r,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Row _station(
      {required String title, required String time, Color? iconColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.white,
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
                  color: AppColors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeights.medium,
                  letterSpacing: 0.0015.sp,
                ),
              ),
              Text(
                time,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.white,
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
}
