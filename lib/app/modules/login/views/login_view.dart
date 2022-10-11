import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/values/app_png_assets.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            child: ElevatedButton(
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
            ),
          ),
        ],
      ),
    );
  }
}
