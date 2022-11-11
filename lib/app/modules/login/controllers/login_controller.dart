import 'package:get/get.dart';

import '../../../core/utils/auth_service.dart';

class LoginController extends GetxController {
  Rx<bool> isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    await AuthService.login();
    isLoading.value = false;
  }
}
