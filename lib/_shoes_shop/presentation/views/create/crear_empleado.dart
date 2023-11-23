import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/empleados_vm.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';
import 'package:shoes_shop/shared/widgets/custom_drop_down.dart';
import 'package:shoes_shop/shared/widgets/custom_text_field.dart';
import 'package:shoes_shop/shared/widgets/separator.dart';

class CrearEmpleadoPage extends StatelessWidget {
  CrearEmpleadoPage({super.key});
  final empleadoVM = EmpleadosViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    if (empleadoVM.loadData.value) {
      empleadoVM.getCargos();
      empleadoVM.getCiudades();
      empleadoVM.getAlmacenes();
    }
    return Scaffold(
        appBar: const CustomAppBar(title: 'Crear Empleado', isBack: true),
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
                        empleadoVM.loadData.value
                            ? CustomTextField(
                                textEditingController:
                                    empleadoVM.cedulaController,
                                labelText: 'Cedula')
                            : Container(),

                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController: empleadoVM.nombreController,
                            labelText: 'Nombre'),
                        const Separator(size: 2),
                        CustomTextField(
                            textEditingController: empleadoVM.sNombreController,
                            labelText: 'Segundo nombre'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                empleadoVM.apellidoController,
                            labelText: 'Apellido'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                empleadoVM.sApellidoController,
                            labelText: 'Segundo Apellido'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                empleadoVM.telefonoController,
                            labelText: 'Telefono'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController: empleadoVM.emailController,
                            labelText: 'Email'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                empleadoVM.direccionController,
                            labelText: 'Direccion'),
                        const Separator(size: 2),

                        //drop
                        CustomDropDownButtom(
                            list: empleadoVM.listaCargos,
                            selectedValue:
                                empleadoVM.selectCargoController.value,
                            onChanged: (value) {
                              empleadoVM.customOnchanges(value!, 1);
                            }),
                        const Separator(size: 2),

                        //drop
                        CustomDropDownButtom(
                            list: empleadoVM.listaAlmacenes,
                            selectedValue:
                                empleadoVM.selectAlmacenController.value,
                            onChanged: (value) {
                              empleadoVM.customOnchanges(value!, 2);
                            }),
                        const Separator(size: 2),

                        //drop
                        CustomDropDownButtom(
                            list: empleadoVM.listaCiudades,
                            selectedValue:
                                empleadoVM.selectCiudadController.value,
                            onChanged: (value) {
                              empleadoVM.customOnchanges(value!, 3);
                            }),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            empleadoVM.loadData.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await empleadoVM.crearEmpleado();
                      },
                      text: 'Crear Empleado',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await empleadoVM.actualizarEmpleado();
                      },
                      text: 'Actualizar Empleado',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
          ],
        ));
  }
}
