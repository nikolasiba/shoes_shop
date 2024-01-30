import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/cartera_vm.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';
import 'package:shoes_shop/shared/widgets/custom_drop_down.dart';
import 'package:shoes_shop/shared/widgets/custom_text_field.dart';
import 'package:shoes_shop/shared/widgets/separator.dart';

class CrearCartera extends StatelessWidget {
  CrearCartera({super.key});
  final carteraVm = CarteraViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    if (carteraVm.loadData.value) {
      carteraVm.getClientes();
    }
    return Scaffold(
        appBar: const CustomAppBar(title: 'Crear Cartera', isBack: true),
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: RawScrollbar(
                thumbColor: ConstColors.principalBlue,
                thumbVisibility: true,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Obx(
                    () => Column(
                      children: [
                        const Separator(size: 2),
                        CustomTextField(
                            textEditingController: carteraVm.deudaController,
                            labelText: 'Deuda actual'),
                        const Separator(size: 2),

                        //drop
                        carteraVm.loadData.value
                            ? CustomDropDownButtom(
                                list: carteraVm.clientes,
                                selectedValue:
                                    carteraVm.selectClientController.value,
                                onChanged: (value) {
                                  carteraVm.selectClientController.value =
                                      value;
                                  carteraVm.selectClient.value = carteraVm
                                      .clientes
                                      .firstWhere((element) =>
                                          element.descripcion == value)
                                      .id!;
                                })
                            : const Center(
                                child: Text(''),
                              ),
                        const Separator(size: 2),

                        const Separator(size: 2),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            carteraVm.loadData.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await carteraVm.crearCartera();
                      },
                      text: 'Crear Cartera',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await carteraVm.actualizarCartera();
                      },
                      text: 'Actualizar Cartera',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
          ],
        ));
  }
}
