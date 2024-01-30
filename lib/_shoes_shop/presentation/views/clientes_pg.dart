import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/cliente_vm.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/create/create_client.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';

class ClientesPAge extends StatelessWidget {
  ClientesPAge({super.key});
  final clientVm = ClienteViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    clientVm.getClients();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Clientes', isBack: true),
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
                      DataColumn(label: Expanded(child: Text('Cedula'))),
                      DataColumn(
                          label:
                              Expanded(child: Text('Nombre(s)            '))),
                      DataColumn(label: Expanded(child: Text('Apellido(s)'))),
                      DataColumn(label: Expanded(child: Text('Telefono'))),
                      DataColumn(label: Expanded(child: Text('Email'))),
                      DataColumn(label: Expanded(child: Text('Direccion'))),
                      DataColumn(label: Expanded(child: Text('Ciudad'))),
                      DataColumn(label: Expanded(child: Text('Departamento'))),
                    ],
                    rows: clientVm.clientes
                        .map((element) => DataRow(cells: <DataCell>[
                              DataCell(Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await clientVm
                                            .deleteCliente(element.id!);
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () async {
                                        await clientVm.setearCampos(element);
                                        Get.to(() => CrearClientePage());
                                      },
                                      icon: const Icon(Icons.edit))
                                ],
                              )),
                              DataCell(Text(element.id.toString())),
                              DataCell(
                                  Text('${element.nombre} ${element.nombre2}')),
                              DataCell(Text(
                                  '${element.apellido} ${element.apellido2}')),
                              DataCell(Text(element.telefono!)),
                              DataCell(Text(element.email!)),
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
                  clientVm.loadData.value = true;
                  // clientVm.clearFields();
                  Get.to(() => CrearClientePage());
                },
                text: 'Crear Cliente',
                width: Get.width * 0.7,
                backgroundColor: ConstColors.principalBlue),
          )
        ],
      ),
    );
  }
}
