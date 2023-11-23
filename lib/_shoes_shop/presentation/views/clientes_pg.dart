import 'package:flutter/material.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/cliente_vm.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';

class ClientesPAge extends StatelessWidget {
  ClientesPAge({super.key});
  final clientVm = ClienteViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Clientes', isBack: true),
        body: Center(
            child: Column(
          children: [
            Container(),
          ],
        )));
  }
}
