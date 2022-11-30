import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/select_trip_controller.dart';

class SelectTripView extends GetView<SelectTripController> {
  const SelectTripView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () {
              return TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(
                    Duration(days: AppSettings.get('maxDayTicketBooking'))),
                focusedDay: controller.focusedDay ?? DateTime.now(),
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay, day);
                },
                calendarFormat: CalendarFormat.week,
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay = selectedDay;
                  controller.focusedDay = focusedDay;
                },
                availableCalendarFormats: const {CalendarFormat.week: ''},
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (context, day) {
                    return Center(
                        child: Text(
                      '${DateFormat('MMMM', 'vi').format(day)} năm ${DateFormat('yyyy', 'vi').format(day)}',
                      style: subtitle1,
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
