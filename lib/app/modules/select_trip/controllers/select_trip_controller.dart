import 'package:fbus_mobile_student/app/core/utils/utils.dart';
import 'package:fbus_mobile_student/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/values/text_styles.dart';
import '../../../core/widget/shared.dart';
import '../../../core/widget/ticket_item_expanded.dart';
import '../../../data/models/selected_trip_model.dart';
import '../../../data/models/trip_model.dart';
import 'select_trip_data_service.dart';

class SelectTripController extends GetxController {
  final Rx<DateTime?> _selectedDay = Rx<DateTime?>(null);
  DateTime? get selectedDay => _selectedDay.value;
  set selectedDay(DateTime? value) {
    _selectedDay.value = value;
  }

  final Rx<DateTime?> _focusedDay = Rx<DateTime?>(null);
  DateTime? get focusedDay => _focusedDay.value;
  set focusedDay(DateTime? value) {
    _focusedDay.value = value;
  }

  SelectTripDataService selectedTripDataService = SelectTripDataService();

  SelectedTrip? selectedTrip = SelectedTrip();

  @override
  void onInit() {
    Map<String, dynamic> arg = {};
    if (Get.arguments != null) {
      arg = Get.arguments as Map<String, dynamic>;
    }
    if (arg.containsKey('selectedTrip')) {
      selectedTrip = arg['selectedTrip'];
    } else {
      showToast('Đã có lỗi xảy ra');
      Get.back();
    }
    super.onInit();
  }

  Widget calendar() {
    return Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(9.r),
              bottomRight: Radius.circular(9.r),
            ),
            boxShadow: kElevationToShadow[1],
          ),
          child: SafeArea(
            child: TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.now()
                  .add(Duration(days: AppSettings.get('maxDayTicketBooking'))),
              focusedDay: focusedDay ?? DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              calendarFormat: CalendarFormat.week,
              onDaySelected: (selectedDay, focusedDay) {
                this.selectedDay = selectedDay;
                this.focusedDay = focusedDay;
                fetchTrip();
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
            ),
          ),
        );
      },
    );
  }

  void fetchTrip() {
    if (selectedDay != null && selectedTrip?.selectedRoute?.id != null) {
      selectedTripDataService.fetchTrip(
        selectedTrip?.selectedRoute?.id ?? '',
        selectedDay!,
      );
    }
  }

  Widget tripList() {
    return Obx(
      (() {
        List<Widget> tripItems = [];

        for (Trip trip in selectedTripDataService.trips ?? []) {
          tripItems.add(tripItem(trip));
        }

        return Column(
          children: tripItems,
        );
      }),
    );
  }

  Widget tripItem(Trip trip) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: TicketItemExpanded(
        trip: trip,
      ),
    );
  }
}
