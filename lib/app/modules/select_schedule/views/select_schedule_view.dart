import 'package:fbus_mobile_student/app/data/local/db/trip_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/shared.dart';
import '../../../core/widget/status_bar.dart';
import '../../../data/models/trip_model.dart';
import '../controllers/select_schedule_controller.dart';

class SelectScheduleView extends GetView<SelectScheduleController> {
  const SelectScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SfCalendar(
                  selectionDecoration: const BoxDecoration(),
                  controller: controller.calendarController,
                  showDatePickerButton: true,
                  view: CalendarView.week,
                  firstDayOfWeek: 1,
                  specialRegions: controller.getTimeRegions(),
                  dataSource: getCalendarDataSource(),
                  appointmentBuilder: (BuildContext context,
                      CalendarAppointmentDetails details) {
                    final Appointment appointment = details.appointments.first;
                    String startTime =
                        DateFormat('hh:mm a').format(appointment.startTime);
                    String endTime =
                        DateFormat('hh:mm a').format(appointment.endTime);
                    if (controller.calendarController.view ==
                        CalendarView.week) {
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
                                      '$startTime - $endTime',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeights.medium,
                                        letterSpacing: 0.0025.sp,
                                      ),
                                    ),
                                  ),
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: kElevationToShadow[1],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    lightBub('Vui lòng chọn thời gian đi'),
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        // onPressed: () {},
                        onPressed: null,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Tiếp tục',
                              style: subtitle2,
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: AppColors.softBlack,
                              size: 20.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppointmentDataSource getCalendarDataSource() {
  // List<Appointment> appointments = <Appointment>[];
  // appointments.add(Appointment(
  //   startTime: DateTime.now(),
  //   endTime: DateTime.now().add(const Duration(hours: 1)),
  //   subject: 'Meeting',
  //   color: AppColors.green,
  // ));

  // appointments.add(Appointment(
  //   startTime: DateTime.now().add(const Duration(hours: 5)),
  //   endTime: DateTime.now().add(const Duration(hours: 8)),
  //   subject: 'Meeting',
  //   color: AppColors.green,
  // ));

  Map<String, Trip> trips = getTrips();

  List<Appointment> appointments = trips.values
      .map(
        (e) => Appointment(
          id: e.id,
          startTime: e.startTime,
          endTime: e.endTime,
          color: e.seatState != 'Hết chỗ' ? AppColors.green : AppColors.gray,
        ),
      )
      .toList();

  return AppointmentDataSource(appointments);
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
