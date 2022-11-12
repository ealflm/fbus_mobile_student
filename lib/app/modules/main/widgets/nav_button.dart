import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/font_weights.dart';
import '../../../core/values/text_styles.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconOutlined,
    required this.onPressed,
    required this.state,
  }) : super(key: key);

  final Function() onPressed;
  final String title;
  final IconData icon;
  final IconData iconOutlined;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.w,
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 26.r,
              width: 26.r,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  state ? icon : iconOutlined,
                  size: 26.r,
                  color: state ? AppColors.primary600 : AppColors.gray,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: state
                    ? overline.copyWith(
                        fontWeight: FontWeights.medium, fontSize: 11.sp)
                    : overline.copyWith(color: AppColors.gray, fontSize: 11.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
