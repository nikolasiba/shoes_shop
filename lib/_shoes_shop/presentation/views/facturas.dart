import 'package:flutter/material.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/facturas_vm.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';

class FacturasPage extends StatelessWidget {
  FacturasPage({super.key});
  final facturaVm = FacturasViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Facturas', isBack: true),
        body: Center(
            child: Column(
          children: [
            Container(),
          ],
        )));
  }
}
