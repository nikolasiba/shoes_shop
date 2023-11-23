import 'package:flutter/material.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/empleados_vm.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';

class EmpleadosPage extends StatelessWidget {
  EmpleadosPage({super.key});
  final empleadoVM = EmpleadosViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Empleado', isBack: true),
      body: Center(
          child: Column(
        children: [
          Container(),
        ],
      )),
    );
  }
}
