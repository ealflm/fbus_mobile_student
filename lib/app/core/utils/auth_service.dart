import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../data/repository/repository.dart';
import '../../routes/app_pages.dart';
import '../base/base_controller.dart';
import 'google_auth_service.dart';

class AuthService extends BaseController {
  static final AuthService _instance = AuthService._internal();
  static AuthService get instance => _instance;
  AuthService._internal();

  final Repository _repository = Get.find(tag: (Repository).toString());

  String? _token;

  /// Get token.
  ///
  /// Return null if token expired.
  String? get token {
    if (_token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(_token.toString());

      DateTime? exp =
          DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);

      if (exp.compareTo(DateTime.now()) <= 0) {
        _token = null;
      }
    }
    return _token;
  }

  static Future<bool> login() async {
    bool result = false;
    User? user;

    try {
      // In some cases logging out is not correct
      // need to call logout here to fix that.
      await GoogleAuthService.logout();

      user = await GoogleAuthService.login();

      if (user != null) {
        String? idToken = await user.getIdToken();

        // Call data service to get token from server
        String? token;
        var loginService = _instance._repository.login(idToken);
        await _instance.callDataService(
          loginService,
          onSuccess: (String response) {
            token = response;
          },
        );

        if (token != null) {
          _instance._token = token;
          result = true;
          Get.offAllNamed(Routes.MAIN);
        }

        // Login successfully.
      } else {
        // Login failed.
      }
    } catch (e) {
      debugPrint('Unable to connect');
      // Unable to connect.
    }

    return result;
  }

  static Future<void> logout() async {
    await GoogleAuthService.logout();
    clearToken();
    Get.offAllNamed(Routes.LOGIN);
  }

  static void clearToken() {
    instance._token = null;
  }
}
