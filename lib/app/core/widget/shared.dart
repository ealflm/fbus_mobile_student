import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
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
            style: subtitle2,
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

/// Returns the builder for schedule view.
Widget scheduleViewMonthHeaderBuilder(
    BuildContext buildContext, ScheduleViewMonthHeaderDetails details) {
  var locale = Localizations.localeOf(buildContext).toString();
  return Stack(
    children: <Widget>[
      Image(
          image: ExactAssetImage(
            'assets/png/month/${DateFormat('MMMM', 'en').format(details.date).toLowerCase()}.png',
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

String formatDuration(Duration d) {
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('$days ngày, ');
  }
  if (tokens.isNotEmpty || hours != 0) {
    tokens.add('${hours.toString().padLeft(2, '0')}:');
  }
  if (tokens.isNotEmpty || minutes != 0) {
    tokens.add('${minutes.toString().padLeft(2, '0')}:');
  }
  tokens.add(seconds.toString().padLeft(2, '0'));

  return tokens.join();
}

String formatDurationOnlyHourMinite(Duration d) {
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (hours != 0) {
    tokens.add('$hours giờ, ');
  }
  if (minutes != 0) {
    tokens.add('$minutes phút');
  }

  return tokens.join();
}
