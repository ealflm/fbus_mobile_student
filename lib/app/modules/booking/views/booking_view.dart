import 'package:fbus_mobile_student/app/core/values/app_colors.dart';
import 'package:fbus_mobile_student/app/core/values/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/values/font_weights.dart';
import '../../../core/widget/status_bar.dart';
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
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: SfCalendar(
            controller: controller.calendarController,
            showDatePickerButton: true,
            allowedViews: controller.allowedViews,
            view: CalendarView.week,
            firstDayOfWeek: 1,
            specialRegions: controller.getTimeRegions(),
            scheduleViewMonthHeaderBuilder:
                controller.scheduleViewMonthHeaderBuilder,
            scheduleViewSettings: const ScheduleViewSettings(
              weekHeaderSettings: WeekHeaderSettings(
                startDateFormat: 'dd/MM',
                endDateFormat: 'dd/MM',
              ),
            ),
            dataSource: _getCalendarDataSource(),
            timeSlotViewSettings: TimeSlotViewSettings(
              timeIntervalHeight: 80.h,
            ),
            appointmentBuilder:
                (BuildContext context, CalendarAppointmentDetails details) {
              final Appointment appointment = details.appointments.first;
              if (controller.calendarController.view == CalendarView.day) {
                return Container(
                  padding: EdgeInsets.all(10.r),
                  color: appointment.color,
                  height: details.bounds.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _station(
                              title: 'Trạm Vinhomes grand park',
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
                              iconColor: AppColors.blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container(
                child: Text(appointment.subject),
              );
            },
          ),
        ),
      ),
    );
  }

  static Container _dot() {
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
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                fontWeight: FontWeights.medium,
                letterSpacing: 0.0015.sp,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                letterSpacing: 0.0015.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(const Duration(hours: 1)),
    subject: 'Meeting',
    color: AppColors.green,
    startTimeZone: '',
    endTimeZone: '',
  ));

  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 5)),
    endTime: DateTime.now().add(const Duration(hours: 8)),
    subject: 'Meeting',
    color: AppColors.green,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
