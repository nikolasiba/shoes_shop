import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/reportes_vm.dart';

class TablaFacturas extends StatelessWidget {
  TablaFacturas({super.key});
  final reportsVm = ReportesViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => DataTable(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  columns: const [
                    DataColumn(label: Text('Id')),
                    DataColumn(label: Text('Valor total')),
                    DataColumn(label: Text('Empleado')),
                    DataColumn(label: Text('Cliente')),
                  ],
                  rows: reportsVm.responseFacturas
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.id.toString())),
                            DataCell(Text(e.total!.toString())),
                            DataCell(Text(e.empleado!)),
                            DataCell(Text(e.cliente!)),
                          ]))
                      .toList()),
            ),
          ),
        ));
  }
}
