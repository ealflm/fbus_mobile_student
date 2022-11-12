import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';
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
