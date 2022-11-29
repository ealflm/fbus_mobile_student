import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SelectModeController {
  final Rx<SelectMode> _mode = Rx<SelectMode>(SelectMode.route);
  SelectMode get mode => _mode.value;
  set mode(SelectMode value) {
    _mode.value = value;
  }

  void next() {
    if (mode == SelectMode.route) {
      mode = SelectMode.station;
    } else if (mode == SelectMode.station) {
      Get.toNamed(Routes.SELECT_TRIP);
    }
  }

  void back() {
    if (mode == SelectMode.station) {
      mode = SelectMode.route;
    }
  }

  bool canBack() {
    return mode == SelectMode.station;
  }
}

enum SelectMode {
  route,
  station,
}
