import 'package:fbus_mobile_student/app/core/widget/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_png_assets.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.light,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.softRed,
              child: Image.asset(
                AppPngAssets.fbusBackground,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              height: 0.35.sh,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.grey.withOpacity(0.0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 0.35.sh,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black.withOpacity(0.6),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 30.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FBus',
                      style: h4.copyWith(color: Colors.white),
                    ),
                    Text(
                      'School bus booking system at FPT University',
                      style: subtitle1.copyWith(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.w,
                    right: 30.w,
                    top: 10.h,
                    bottom: 30.w,
                  ),
                  child: _loginWithGoogleButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _loginWithGoogleButton() {
    return ElevatedButton(
      onPressed: controller.login,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppPngAssets.google,
              width: 30.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Login with Google',
              style: subtitle1.copyWith(fontWeight: FontWeights.medium),
            ),
          ],
        ),
      ),
    );
  }
}
