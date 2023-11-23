import 'package:flutter/material.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/productos_vm.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';

class ProductosPAge extends StatelessWidget {
  ProductosPAge({super.key});
  final productosVm = ProductosViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Productos', isBack: true),
        body: Center(
            child: Column(
          children: [
            Container(),
          ],
        )));
  }
}
