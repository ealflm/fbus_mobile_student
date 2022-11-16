import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../values/app_colors.dart';
import '../values/app_svg_assets.dart';
import '../values/font_weights.dart';
import '../values/text_styles.dart';

Container dot() {
  return Container(
    width: 3.r,
    height: 3.r,
    decoration: const BoxDecoration(
      color: AppColors.indicator,
      shape: BoxShape.circle,
    ),
  );
}

Row station({required String title, required String time, Color? iconColor}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: iconColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.directions_bus,
          color: AppColors.white,
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
            style: subtitle1.copyWith(
              fontWeight: FontWeights.medium,
            ),
          ),
          Text(
            time,
            style: subtitle1.copyWith(
              color: AppColors.lightBlack,
            ),
          ),
        ],
      ),
    ],
  );
}

Row selectStation({
  String? title,
  String? secondTitle,
  String? time,
  Color? iconColor,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: iconColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.directions_bus,
          color: AppColors.white,
          size: 15.r,
        ),
      ),
      SizedBox(
        width: 8.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title,
                  style: subtitle1.copyWith(
                    fontWeight: FontWeights.medium,
                  ),
                )
              : secondTitle != null
                  ? Text(
                      secondTitle,
                      style: subtitle1.copyWith(
                        fontWeight: FontWeights.light,
                        color: AppColors.description,
                      ),
                    )
                  : Text(
                      '-',
                      style: subtitle1.copyWith(
                        fontWeight: FontWeights.medium,
                      ),
                    ),
        ],
      ),
    ],
  );
}

Column lightBub(String text) {
  return Column(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 19.r,
            height: 19.r,
            padding: EdgeInsets.all(3.r),
            decoration: const BoxDecoration(
              color: AppColors.softBlack,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AppSvgAssets.lightBulb,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: subtitle2.copyWith(),
          ),
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}

void showToast(String message) {
  Fluttertoast.showToast(
    backgroundColor: AppColors.black.withOpacity(0.5),
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  );
}

AppointmentDataSource getCalendarDataSource() {
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

  return AppointmentDataSource(appointments);
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
