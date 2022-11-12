import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingController extends GetxController {
  CalendarController calendarController = CalendarController();

  /// Disable some moment in day.
  List<TimeRegion> getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];

    DateTime date = DateTime.now();
    date = DateTime(date.year, date.month, date.day, 12, 0, 0);

    regions.add(
      TimeRegion(
        startTime: DateTime(0, 0, 0),
        endTime: DateTime(0, 0, 0, 5),
        enablePointerInteraction: false,
        textStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR,SA,SU',
      ),
    );

    regions.add(
      TimeRegion(
        startTime: DateTime(0, 0, 0, 21),
        endTime: DateTime(0, 0, 0, 24),
        enablePointerInteraction: false,
        textStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        color: Colors.grey.withOpacity(0.2),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR,SA,SU',
      ),
    );

    return regions;
  }

  /// List of calendar mode.
  final List<CalendarView> allowedViews = <CalendarView>[
    CalendarView.day,
    CalendarView.week,
    CalendarView.schedule
  ];

  /// Returns the builder for schedule view.
  Widget scheduleViewMonthHeaderBuilder(
      BuildContext buildContext, ScheduleViewMonthHeaderDetails details) {
    var locale = Localizations.localeOf(buildContext).toString();
    return Stack(
      children: <Widget>[
        Image(
            image: ExactAssetImage(
              'assets/png/month/${DateFormat('MMMM').format(details.date).toLowerCase()}.png',
            ),
            fit: BoxFit.cover,
            width: details.bounds.width,
            height: details.bounds.height),
        Positioned(
          left: 55,
          right: 0,
          top: 20,
          bottom: 0,
          child: Text(
            '${DateFormat('MMMM', locale).format(details.date)} ${details.date.year}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
