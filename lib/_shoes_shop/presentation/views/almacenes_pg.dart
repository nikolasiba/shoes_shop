import 'package:flutter/material.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/almacenes_vm.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';

class AlmacenesPAge extends StatelessWidget {
  AlmacenesPAge({super.key});
  final almacenesVm = AlmacenesViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Almacenes', isBack: true),
        body: Center(
            child: Column(
          children: [
            Container(),
          ],
        )));
  }
}
