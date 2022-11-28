import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbus_mobile_student/app/core/values/app_colors.dart';
import 'package:fbus_mobile_student/app/core/values/app_png_assets.dart';
import 'package:fbus_mobile_student/app/core/widget/shared.dart';
import 'package:fbus_mobile_student/app/data/models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/values/app_svg_assets.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../../../core/widget/ticket_item.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.light,
      child: Scaffold(
        backgroundColor: AppColors.primary400,
        body: Stack(
          children: [
            Image.asset(
              AppPngAssets.blueBackground,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 15.w, right: 15.w),
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox.fromSize(
                                      size:
                                          Size.fromRadius(18.r), // Image radius
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
                                              : SvgPicture.asset(
                                                  AppSvgAssets.male);
                                        },
                                        imageUrl: 'url',
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) {
                                          return 'True' == 'False'
                                              ? SvgPicture.asset(
                                                  AppSvgAssets.female)
                                              : SvgPicture.asset(
                                                  AppSvgAssets.male);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Xin chào',
                                        style: body2.copyWith(
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        'Nguyễn Hữu Toàn',
                                        style: subtitle1.copyWith(
                                          fontWeight: FontWeights.medium,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.all(11.r),
                                  minimumSize: Size.zero, // Set this
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.notifications_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TicketItem(
                        title: 'Chuyến đi hiện tại',
                        model: TicketModel(
                          startStation: 'FPT University',
                          endStation: 'Vimhomes grand park',
                          startTime: DateTime.now(),
                          endTime: DateTime.now().add(const Duration(hours: 1)),
                          distance: 15,
                          estimatedTime: const Duration(minutes: 30),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            color: AppColors.white,
                            boxShadow: kElevationToShadow[2],
                          ),
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            top: 15.h,
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
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _summarizeLabel('17 vé', 'Đã đặt'),
                                  _summarizeLabel('2 vé', 'Đã quét'),
                                  _summarizeLabel('15 km', 'Đã đi'),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9.r),
                                topRight: Radius.circular(9.r),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _mainButton(
                                      text: 'Lịch trình',
                                      icon: Icons.insert_invitation,
                                      iconColor: AppColors.purple,
                                      onPressed: () {
                                        Get.toNamed(Routes.BOOKING);
                                      },
                                    ),
                                    _mainButton(
                                      text: 'Đặt lịch',
                                      icon: Icons.pending_actions,
                                      iconColor: AppColors.blue,
                                      onPressed: () {
                                        Get.toNamed(Routes.SELECT_ROUTE);
                                      },
                                    ),
                                    _mainButton(
                                      text: 'Quét QR',
                                      icon: Icons.qr_code_scanner,
                                      iconColor: AppColors.green,
                                      onPressed: () {
                                        Get.toNamed(Routes.SCAN);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _mainButton(
                                      text: 'Đánh giá',
                                      icon: Icons.thumb_up_alt_outlined,
                                      iconColor: AppColors.yellow,
                                      // onPressed: () {
                                      //   Get.toNamed(Routes.FEED_BACK);
                                      // },
                                    ),
                                    _mainButton(
                                      text: 'Bản đồ',
                                      icon: Icons.map_outlined,
                                      iconColor: AppColors.red,
                                    ),
                                    _mainButton(
                                      text: 'Vé của tôi',
                                      icon: Icons.confirmation_number_outlined,
                                      iconColor: AppColors.hardBlue,
                                      onPressed: () {
                                        Get.offAllNamed(
                                          Routes.MAIN,
                                          arguments: {'tabIndex': 1},
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _mainButton(
      {required String text,
      required IconData icon,
      required Color iconColor,
      Function()? onPressed}) {
    return SizedBox(
      width: 100.w,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.sp,
              color: onPressed != null ? iconColor : AppColors.gray,
            ),
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
