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
import '../../../data/local/db/trip_data.dart';
import '../../../data/models/trip_model.dart';
import '../../../routes/app_pages.dart';
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
                  timeSlotViewSettings:
                      TimeSlotViewSettings(timeIntervalHeight: 80.h),
                  controller: controller.calendarController,
                  showDatePickerButton: true,
                  view: CalendarView.week,
                  firstDayOfWeek: 1,
                  specialRegions: controller.getTimeRegions(),
                  scheduleViewMonthHeaderBuilder:
                      scheduleViewMonthHeaderBuilder,
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
                      return Obx(() {
                        TripState state = TripState.onReady;
                        List<String> selectedTripIds =
                            controller.selectedTripIds;
                        if (DateTime.now().compareTo(appointment.startTime) >=
                            0) {
                          state = TripState.overTime;
                        } else if (appointment.notes == 'Hết chỗ') {
                          state = TripState.overSeat;
                        } else if (selectedTripIds.contains(appointment.id)) {
                          state = TripState.selected;
                        }

                        Color color = AppColors.green;
                        if (state == TripState.overTime) {
                          color = Colors.grey.withOpacity(0.4);
                        } else if (state == TripState.overSeat) {
                          color = AppColors.caption;
                        } else if (state == TripState.selected) {
                          color = AppColors.green;
                        }

                        String notes = appointment.notes ?? '';
                        if (state == TripState.overTime) {
                          notes = 'Quá hạn';
                        }

                        return Stack(
                          children: [
                            Material(
                              child: InkWell(
                                onTap: state == TripState.overTime ||
                                        state == TripState.overSeat
                                    ? null
                                    : () {
                                        controller.toggleSelectedTripId(
                                            appointment.id as String);
                                      },
                                child: Ink(
                                  color: color,
                                  padding: const EdgeInsets.all(4),
                                  height: details.bounds.height,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$startTime - $endTime',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeights.regular,
                                            letterSpacing: 0.0025.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          notes,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 7.sp,
                                            fontWeight: FontWeights.medium,
                                            letterSpacing: 0.0025.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IgnorePointer(
                              child: state == TripState.selected
                                  ? Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: AppColors.secondary,
                                        width: 2,
                                      )),
                                    )
                                  : Container(),
                            ),
                          ],
                        );
                      });
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
                    Obx(
                      () {
                        if (controller.selectedTripIds.isNotEmpty) {
                          return Column(
                            children: [
                              Text(
                                  'Đã chọn: ${controller.selectedTripIds.length}',
                                  style: subtitle2),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          );
                        } else {
                          return lightBub('Vui lòng chọn thời gian đi');
                        }
                      },
                    ),
                    Obx(
                      () => SizedBox(
                        height: 40.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          onPressed: controller.selectedTripIds.isNotEmpty
                              ? () {
                                  Get.toNamed(
                                    Routes.CONFIRM_TICKET,
                                    arguments: {
                                      'selectedTripIds':
                                          controller.selectedTripIds,
                                    },
                                  );
                                }
                              : null,
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
  Map<String, Trip> trips = getTrips();

  List<Appointment> appointments = trips.values
      .map(
        (e) => Appointment(
          id: e.id,
          startTime: e.startTime,
          endTime: e.endTime,
          notes: e.seatState,
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

enum TripState { overTime, overSeat, onReady, selected }
