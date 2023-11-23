import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/cartera_vm.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/create/create_cartera.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/create/create_client.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';

class CarteraPage extends StatelessWidget {
  CarteraPage({super.key});
  final carteraVm = CarteraViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    carteraVm.getCartera();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cartera', isBack: true),
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
                      DataColumn(label: Expanded(child: Text('Deuda'))),
                    ],
                    rows: carteraVm.carteras
                        .map((element) => DataRow(cells: <DataCell>[
                              DataCell(Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await carteraVm
                                            .deleteCartera(element.id!);
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () async {
                                        await carteraVm.setearCampos(element);
                                        Get.to(() => CrearClientePage());
                                      },
                                      icon: const Icon(Icons.edit))
                                ],
                              )),
                              DataCell(Text(element.id.toString())),
                              DataCell(Text('${element.nombre}')),
                              DataCell(Text('${element.apellido}')),
                              DataCell(Text(element.valor.toString())),
                            ]))
                        .toList())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
                onPressed: () {
                  carteraVm.loadData.value = true;
                  carteraVm.clearFields();
                  Get.to(() => CrearCartera());
                },
                text: 'Crear Cartera',
                width: Get.width * 0.7,
                backgroundColor: ConstColors.principalBlue),
          )
        ],
      ),
    );
  }
}
