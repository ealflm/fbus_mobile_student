import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SelectScheduleController extends GetxController {
  CalendarController calendarController = CalendarController();

  final Rx<List<String>> _selectedTripIds = Rx<List<String>>([]);

  List<String> get selectedTripIds => _selectedTripIds.value;

  void toggleSelectedTripId(String id) {
    _selectedTripIds.update(
      (value) {
        if (!value!.contains(id)) {
          value.add(id);
        } else {
          value.remove(id);
        }
      },
    );
  }

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
}
