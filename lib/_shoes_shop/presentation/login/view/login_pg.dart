import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/home/view/home_pg.dart';
import 'package:shoes_shop/_shoes_shop/presentation/login/view_model/login_vm.dart';
import 'package:shoes_shop/shared/assets/assets.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/util/responsive.dart';
import 'package:shoes_shop/shared/widgets/custom_alert.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';
import 'package:shoes_shop/shared/widgets/custom_text_field.dart';
import 'package:shoes_shop/shared/widgets/separator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginViewModel loginViewModel = LoginViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          Res.images.loginBackground,
          height: Get.height,
          width: Get.width,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const Separator(size: 18),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Text('¡Bienvenido a Shoes Shop! \n ¿Preparado para iniciar?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 25, 111, 151),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      )),
                  const Separator(size: 2),
                  CustomTextField(
                    icon: Icon(
                      Icons.person,
                      color: ConstColors.white,
                    ),
                    textColor: ConstColors.white,
                    borderColor: ConstColors.white,
                    textEditingController: loginViewModel.userController,
                    labelText: 'Usuario',
                  ),
                  const Separator(size: 2),
                  CustomTextField(
                    icon: Icon(Icons.lock, color: ConstColors.white),
                    textColor: ConstColors.white,
                    borderColor: ConstColors.white,
                    textEditingController: loginViewModel.passwordController,
                    labelText: 'Contraseña',
                  ),
                  const Separator(size: 2),
                  CustomButton(
                      onPressed: () {
                        if (loginViewModel.login()) {
                          Get.offAll(() => HomePage());
                        } else {
                          CustomAlert(
                              title: 'Error',
                              body: ' Usuario o contraseña incorrectos');
                        }
                      },
                      text: 'Iniciar Sesion',
                      colorContent: ConstColors.greyText,
                      width: Get.width * 0.8,
                      backgroundColor: ConstColors.white)
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
