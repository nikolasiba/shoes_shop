import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/empleados_vm.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/create/crear_empleado.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';

class EmpleadosPage extends StatelessWidget {
  EmpleadosPage({super.key});
  final empleadoVM = EmpleadosViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    empleadoVM.getEmpleados();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Empleado', isBack: true),
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
                      DataColumn(
                          label:
                              Expanded(child: Text('Apellido(s)          '))),
                      DataColumn(label: Expanded(child: Text('Telefono'))),
                      DataColumn(label: Expanded(child: Text('Email'))),
                      DataColumn(label: Expanded(child: Text('Cargo'))),
                      DataColumn(label: Expanded(child: Text('Direccion'))),
                      DataColumn(label: Expanded(child: Text('Ciudad'))),
                      DataColumn(label: Expanded(child: Text('Departamento'))),
                    ],
                    rows: empleadoVM.listaEmpleado
                        .map((element) => DataRow(cells: <DataCell>[
                              DataCell(Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await empleadoVM
                                            .deleteEmpleado(element.id!);
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () async {
                                        await empleadoVM.setearCampos(element);
                                        Get.to(() => CrearEmpleadoPage());
                                      },
                                      icon: const Icon(Icons.edit))
                                ],
                              )),
                              DataCell(Text(
                                  '${element.nombre!} ${element.sNombre!}')),
                              DataCell(Text(
                                  '${element.apellido!} ${element.sApellido!}')),
                              DataCell(Text(element.email!)),
                              DataCell(Text(element.telefono!)),
                              DataCell(Text(element.cargo!)),
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
                  empleadoVM.loadData.value = true;
                  empleadoVM.clearFields();
                  Get.to(() => CrearEmpleadoPage());
                },
                text: 'Crear Empleado',
                width: Get.width * 0.7,
                backgroundColor: ConstColors.principalBlue),
          )
        ],
      ),
    );
  }
}
