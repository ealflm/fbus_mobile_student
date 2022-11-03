import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';
import '../widgets/nav_button.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HomeView(),
          Obx(
            () {
              return PageStorage(
                bucket: controller.bucket,
                child: controller.currentScreen,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.h,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          height: 60.h,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavButton(
                  title: 'Trang chủ',
                  icon: Icons.explore,
                  iconOutlined: Icons.explore_outlined,
                  onPressed: () {
                    controller.changeTab(0);
                  },
                  state: controller.currentTab.value == 0,
                ),
                NavButton(
                  title: 'Vé của tôi',
                  icon: Icons.confirmation_number,
                  iconOutlined: Icons.confirmation_number_outlined,
                  onPressed: () {
                    controller.changeTab(1);
                  },
                  state: controller.currentTab.value == 1,
                ),
                NavButton(
                  title: 'Đặt vé',
                  icon: Icons.insert_invitation,
                  iconOutlined: Icons.insert_invitation_outlined,
                  onPressed: () {
                    controller.changeTab(2);
                  },
                  state: controller.currentTab.value == 2,
                ),
                NavButton(
                  title: 'Tài khoản',
                  icon: Icons.person,
                  iconOutlined: Icons.person_outlined,
                  onPressed: () {
                    controller.changeTab(3);
                  },
                  state: controller.currentTab.value == 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
