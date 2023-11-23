import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/almacenes_vm.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/create/crear_almacen.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';

class AlmacenesPAge extends StatelessWidget {
  AlmacenesPAge({super.key});
  final almacenesVm = AlmacenesViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    almacenesVm.getCiudades();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Almacenes', isBack: true),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(() => DataTable(
                    border: TableBorder.all(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    columns: const [
                      DataColumn(label: Expanded(child: Text('Gestionar'))),
                      DataColumn(
                          label:
                              Expanded(child: Text('Nombre(s)            '))),
                      DataColumn(label: Expanded(child: Text('Direccion'))),
                      DataColumn(label: Expanded(child: Text('Ciudad'))),
                      DataColumn(label: Expanded(child: Text('Departamento'))),
                    ],
                    rows: almacenesVm.almacenes
                        .map((element) => DataRow(cells: <DataCell>[
                              DataCell(Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await almacenesVm
                                            .deleteAlmacen(element.id!);
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () async {
                                        // await empleadoVM.setearCampos(element);
                                        // Get.to(() => CrearEmpleadoPage());
                                      },
                                      icon: const Icon(Icons.edit))
                                ],
                              )),
                              DataCell(Text('${element.nombre}')),
                              DataCell(Text(element.direccion!)),
                              DataCell(Text(element.ciudad!)),
                              DataCell(Text(element.departamento!)),
                            ]))
                        .toList())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
                onPressed: () {
                  // empleadoVM.loadData.value = true;
                  // empleadoVM.clearFields();
                  Get.to(() => CrearAlmacenPage());
                },
                text: 'Crear Almacen',
                width: Get.width * 0.7,
                backgroundColor: ConstColors.principalBlue),
          )
        ],
      ),
    );
  }
}
