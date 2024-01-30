import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/reportes_vm.dart';

class TablaCliente extends StatelessWidget {
  TablaCliente({super.key});
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
                  DataColumn(label: Text('Id')),
                  DataColumn(label: Text('Nombre(s)')),
                  DataColumn(label: Text('Apellido(s)')),
                  DataColumn(label: Text('Telefono')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Direccion')),
                  DataColumn(label: Text('Ciudad')),
                  DataColumn(label: Text('Departamento')),
                ],
                rows: reportsVm.responseCliente
                    .map((e) => DataRow(cells: [
                          DataCell(Text(e.id.toString())),
                          DataCell(Text('${e.nombre} ${e.nombre2}')),
                          DataCell(Text('${e.apellido} ${e.apellido2}')),
                          DataCell(Text(e.telefono!)),
                          DataCell(Text(e.email!)),
                          DataCell(Text(e.direccion!)),
                          DataCell(Text(e.ciudad!)),
                          DataCell(Text(e.departamento!)),
                        ]))
                    .toList()),
          ),
        ));
  }
}
