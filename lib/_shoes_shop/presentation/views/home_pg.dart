import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/home_vm.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/util/util.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final loginViewModel = HomeViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    loginViewModel.fullOptions();
    return Scaffold(
        appBar: CustomAppBar(
            title: '¿Que deseas hacer hoy ?',
            isBack: false,
            name:
                '${Util.data.getUser().nombre} ${Util.data.getUser().apellido}'),
        body: Obx(
          () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .7,
              mainAxisSpacing: 20,
            ),
            itemCount: loginViewModel.options.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: loginViewModel.options[index].onPressed,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        loginViewModel.options[index].image,
                        fit: BoxFit.scaleDown,
                        height: 100,
                        width: 80,
                        color: ConstColors.principalBlue,
                      ),
                      AutoSizeText(
                        loginViewModel.options[index].title,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
