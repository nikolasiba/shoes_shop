import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/reportes_vm.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/widget/tabla_cleinte.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/widget/tabla_cuentas.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/widget/tabla_empleado.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/widget/tabla_facturas.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/widget/tabla_productos.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_drop_down.dart';

class ReportesPage extends StatelessWidget {
  ReportesPage({super.key});
  final reportsVm = ReportesViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    reportsVm.selectedReportType.value =
        reportsVm.reportsTypeList.first.descripcion!;

    return Scaffold(
        appBar: const CustomAppBar(title: 'Reportes', isBack: true),
        body: Obx(() => Column(
              children: [
                CustomDropDownButtom(
                  list: reportsVm.reportsTypeList,
                  selectedValue: reportsVm.selectedReportType.value,
                  onChanged: (value) async {
                    reportsVm.selectedReportType.value = value;

                    await reportsVm.dynamicOnchange();
                  },
                ),
                Flexible(flex: 5, child: _selectetWidget()),
              ],
            )));
  }

  Widget _selectetWidget() {
    switch (reportsVm.selectedReportType.value) {
      case 'Reporte de Empleados por almacen':
        return TablaEmpleado();
      case 'Reporte de productos':
        return TablaProductos();
      case 'Reporte de clientes':
        return TablaCliente();
      case 'Reporte de cuentas':
        return TablaCuentas();
      case 'Reporte de facturas':
        return TablaFacturas();
      default:
        return Container();
    }
  }
}
