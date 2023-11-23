import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/almacenes_vm.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/empleados_vm.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';
import 'package:shoes_shop/shared/widgets/custom_drop_down.dart';
import 'package:shoes_shop/shared/widgets/custom_text_field.dart';
import 'package:shoes_shop/shared/widgets/separator.dart';

class CrearAlmacenPage extends StatelessWidget {
  CrearAlmacenPage({super.key});
  final almacenVM = AlmacenesViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    if (almacenVM.loadData.value) {
      almacenVM.getCiudades();
    }
    return Scaffold(
        appBar: const CustomAppBar(title: 'Crear almacen', isBack: true),
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
                        almacenVM.loadData.value
                            ? CustomTextField(
                                textEditingController:
                                    almacenVM.cedulaController,
                                labelText: 'Id')
                            : Container(),

                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                almacenVM.direccionController,
                            labelText: 'Direccion'),
                        const Separator(size: 2),

                        //drop
                        CustomDropDownButtom(
                            list: almacenVM.ciudades,
                            selectedValue:
                                almacenVM.selectCiudadController.value,
                            onChanged: (value) {
                              almacenVM.selectCiudadController.value = value;
                              almacenVM.selectCiudad.value = almacenVM.ciudades
                                  .firstWhere(
                                      (element) => element.descripcion == value)
                                  .id!;
                            }),
                        const Separator(size: 2),

                        const Separator(size: 2),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            almacenVM.loadData.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await almacenVM.crearEmpleado();
                      },
                      text: 'Crear Almacen',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await almacenVM.actualizarEmpleado();
                      },
                      text: 'Actualizar almacen',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
          ],
        ));
  }
}
