import 'package:fbus_mobile_student/app/core/utils/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/status_bar.dart';
import '../controllers/account_controller.dart';
import '../widgets/account_item.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.light,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: AppColors.orange,
                  height: 250.h,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(58.r),
                            child: Container(color: AppColors.red),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Đào Phương Nam',
                          style: h6.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  ElevatedButton(
                    onPressed: AuthService.logout,
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.power_settings_new,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Đăng xuất',
                          style: subtitle1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
