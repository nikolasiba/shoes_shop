import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/login_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/login_repo.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/home_pg.dart';
import 'package:shoes_shop/shared/util/preferences.dart';
import 'package:shoes_shop/shared/widgets/custom_alert.dart';

class LoginViewModel extends GetxController {
  //
  final prefs = Preferences();
  final LoginService loginService = LoginService(LoginRepository());
  //
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      Empleado empleado = Empleado();
      empleado = await loginService.login(
          user: userController.text, password: passwordController.text);

      if (empleado.id != null) {
        prefs.user = jsonEncode(empleado.toJson());
        log(prefs.user);
        Get.to(() => HomePage());
      } else {
        CustomAlert(
            title: 'Error',
            body: 'El usuario o la contraseña son incorrectos ');
      }
    } catch (e) {
      CustomAlert(
          title: 'Error', body: 'El usuario o la contraseña son incorrectos ');
    }
  }

  static LoginViewModel get findOrInitialize {
    try {
      return Get.find<LoginViewModel>();
    } catch (e) {
      Get.put(LoginViewModel());
      return Get.find<LoginViewModel>();
    }
  }
}
