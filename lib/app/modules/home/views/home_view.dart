import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbus_mobile_student/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/values/app_svg_assets.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        backgroundColor: AppColors.primary600,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(18.r), // Image radius
                                  child:
                                      // Obx(
                                      //   () =>
                                      CachedNetworkImage(
                                    fadeInDuration: const Duration(),
                                    fadeOutDuration: const Duration(),
                                    placeholder: (context, url) {
                                      return 'True' == 'False'
                                          ? SvgPicture.asset(
                                              AppSvgAssets.female)
                                          : SvgPicture.asset(AppSvgAssets.male);
                                    },
                                    imageUrl: 'url',
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) {
                                      return 'True' == 'False'
                                          ? SvgPicture.asset(
                                              AppSvgAssets.female)
                                          : SvgPicture.asset(AppSvgAssets.male);
                                    },
                                  ),
                                  // ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Xin chào',
                                    style: body2,
                                  ),
                                  Text(
                                    'Nguyễn Hữu Toàn',
                                    style: subtitle1.copyWith(
                                      fontWeight: FontWeights.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(11.r),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.notifications_outlined,
                              color: AppColors.softBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _currentTicket(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r),
                        ),
                        color: AppColors.white,
                        boxShadow: kElevationToShadow[3],
                      ),
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Thống kê theo tháng',
                            style: subtitle2.copyWith(
                              fontWeight: FontWeights.light,
                              color: AppColors.lightBlack,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _summarizeLabel('17 vé', 'Đã đặt'),
                              _summarizeLabel('2 vé', 'Đã quét'),
                              _summarizeLabel('15 km', 'Đã đi'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _mainButton(
                                'Lịch trình',
                                Icon(
                                  Icons.insert_invitation,
                                  size: 30.sp,
                                  color: AppColors.purple,
                                ),
                              ),
                              _mainButton(
                                'Đặt lịch',
                                Icon(
                                  Icons.pending_actions,
                                  size: 30.sp,
                                  color: AppColors.blue,
                                ),
                              ),
                              _mainButton(
                                'Quét QR',
                                Icon(
                                  Icons.qr_code_scanner,
                                  size: 30.sp,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _mainButton(
                                'Đánh giá',
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                  size: 30.sp,
                                  color: AppColors.yellow,
                                ),
                              ),
                              _mainButton(
                                'Bản đồ',
                                Icon(
                                  Icons.map_outlined,
                                  size: 30.sp,
                                  color: AppColors.red,
                                ),
                              ),
                              _mainButton(
                                'Vé của tôi',
                                Icon(
                                  Icons.confirmation_number_outlined,
                                  size: 30.sp,
                                  color: AppColors.hardBlue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _currentTicket() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      alignment: Alignment.bottomCenter,
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, bottom: 20.h, top: 10.h),
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(9.r),
              ),
              boxShadow: kElevationToShadow[1],
            ),
            child: Column(
              children: [
                Text(
                  'Chuyến đi hiện tại',
                  style: subtitle2.copyWith(
                    fontWeight: FontWeights.light,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          station(
                            title: 'Vinhomes grand park',
                            time: '07:00',
                            iconColor: AppColors.green,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 11.r),
                            child: Column(
                              children: [
                                dot(),
                                SizedBox(height: 3.h),
                                dot(),
                                SizedBox(height: 3.h),
                                dot(),
                                SizedBox(height: 3.h),
                              ],
                            ),
                          ),
                          station(
                            title: 'FPT University',
                            time: '07:35',
                            iconColor: AppColors.secondary,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Khoảng cách',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeights.regular,
                                letterSpacing: 0.0025.sp,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '20',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeights.medium,
                                  letterSpacing: 0.0025.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'km',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeights.medium,
                                      letterSpacing: 0.0025.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h),
                            RichText(
                              text: TextSpan(
                                text: 'Thời gian: ',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.regular,
                                  letterSpacing: 0.0025.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: '15 phút',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeights.medium,
                                      letterSpacing: 0.0025.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _summarizeLabel(String title, String description) {
    return Column(
      children: [
        Text(title, style: subtitle1.copyWith(fontWeight: FontWeights.bold)),
        Text(description,
            style: subtitle2.copyWith(fontWeight: FontWeights.light)),
      ],
    );
  }

  Widget _mainButton(String text, Icon icon) {
    return SizedBox(
      width: 100.w,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
        ),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 10.h,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                text,
                style: subtitle2.copyWith(fontWeight: FontWeights.light),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container dot() {
  return Container(
    width: 2.r,
    height: 2.r,
    decoration: const BoxDecoration(
      color: AppColors.white,
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
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: kElevationToShadow[1],
        ),
        child: Icon(
          Icons.directions_bus,
          color: iconColor,
          size: 15.r,
        ),
      ),
      SizedBox(
        width: 8.w,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                fontWeight: FontWeights.medium,
                letterSpacing: 0.0015.sp,
              ),
            ),
            Text(
              time,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                letterSpacing: 0.0015.sp,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
