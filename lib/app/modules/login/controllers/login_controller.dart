import 'package:get/get.dart';

import '../../../core/utils/auth_service.dart';

class LoginController extends GetxController {
  void login() {
    AuthService.login();
  }
}
