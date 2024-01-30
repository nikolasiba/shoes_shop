import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/reportes_vm.dart';

class TablaProductos extends StatelessWidget {
  TablaProductos({super.key});
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
                    DataColumn(label: Text('Nombre(s)')),
                    DataColumn(label: Text('Precio')),
                    DataColumn(label: Text('Cantidad disponible')),
                    DataColumn(label: Text('Categoria')),
                  ],
                  rows: reportsVm.responseProducto
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.id.toString())),
                            DataCell(Text(e.nombre!)),
                            DataCell(Text(e.precio.toString())),
                            DataCell(Text(e.cantidad.toString())),
                            DataCell(Text(e.categoria!)),
                          ]))
                      .toList()),
            ),
          ),
        ));
  }
}
