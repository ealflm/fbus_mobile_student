import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/font_weights.dart';
import '../../../../core/values/text_styles.dart';
import '../../controllers/ticket_controller.dart';

class BookedView extends GetView<TicketController> {
  const BookedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          _ticket(),
          _ticket(),
          _ticket(),
          _ticket(),
          _ticket(),
        ],
      ),
    );
  }

  Container _ticket() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 15.h,
        left: 15.w,
        right: 15.w,
      ),
      padding: EdgeInsets.only(
        top: 15.h,
        bottom: 15.h,
        left: 18.w,
        right: 18.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(9.r),
        ),
        boxShadow: kElevationToShadow[1],
      ),
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
                    style: body2.copyWith(color: AppColors.lightBlack),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '20',
                      style: h4.copyWith(fontWeight: FontWeights.medium),
                      children: [
                        TextSpan(
                          text: 'km',
                          style: h6.copyWith(fontWeight: FontWeights.regular),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  RichText(
                    text: TextSpan(
                      text: 'Thời gian: ',
                      style: body2.copyWith(color: AppColors.lightBlack),
                      children: [
                        TextSpan(
                          text: '15 phút',
                          style: subtitle2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '03/11/2022',
                style: subtitle1,
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
                    SizedBox(height: 5.h),
                    _dot(),
                    SizedBox(height: 5.h),
                    _dot(),
                    SizedBox(height: 9.h),
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
    );
  }

  static Container _dot() {
    return Container(
      width: 3.r,
      height: 3.r,
      decoration: const BoxDecoration(
        color: AppColors.indicator,
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
}
