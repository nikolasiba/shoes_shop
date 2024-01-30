import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/reportes_vm.dart';

class TablaEmpleado extends StatelessWidget {
  TablaEmpleado({super.key});
  final reportsVm = ReportesViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => DataTable(
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(15),
                ),
                columns: const [
                  DataColumn(label: Text('Almacen')),
                  DataColumn(label: Text('Id')),
                  DataColumn(label: Text('Nombre(s)')),
                  DataColumn(label: Text('Apellido(s)')),
                  DataColumn(label: Text('Telefono')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Direccion')),
                  DataColumn(label: Text('Cargo')),
                  DataColumn(label: Text('Departamento')),
                ],
                rows: reportsVm.responseEmpleado
                    .map((e) => DataRow(cells: [
                          DataCell(Text(e.almacen!)),
                          DataCell(Text(e.id.toString())),
                          DataCell(Text('${e.nombre} ${e.sNombre}')),
                          DataCell(Text('${e.apellido} ${e.sApellido}')),
                          DataCell(Text(e.telefono!)),
                          DataCell(Text(e.email!)),
                          DataCell(Text(e.direccion!)),
                          DataCell(Text(e.cargo!)),
                          DataCell(Text(e.departamento!)),
                        ]))
                    .toList()),
          ),
        ));
  }
}
