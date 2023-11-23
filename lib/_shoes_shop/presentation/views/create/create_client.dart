import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/presentation/view_model/cliente_vm.dart';
import 'package:shoes_shop/shared/colors/colors.dart';
import 'package:shoes_shop/shared/widgets/custom_app_bar.dart';
import 'package:shoes_shop/shared/widgets/custom_button.dart';
import 'package:shoes_shop/shared/widgets/custom_drop_down.dart';
import 'package:shoes_shop/shared/widgets/custom_text_field.dart';
import 'package:shoes_shop/shared/widgets/separator.dart';

class CrearClientePage extends StatelessWidget {
  CrearClientePage({super.key});
  final clienteVm = ClienteViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    if (clienteVm.loadData.value) {
      clienteVm.getCiudades();
    }
    return Scaffold(
        appBar: const CustomAppBar(title: 'Crear Cliente', isBack: true),
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
                        clienteVm.loadData.value
                            ? CustomTextField(
                                textEditingController:
                                    clienteVm.cedulaController,
                                labelText: 'Cedula')
                            : Container(),

                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController: clienteVm.nombreController,
                            labelText: 'Nombre'),
                        const Separator(size: 2),
                        CustomTextField(
                            textEditingController: clienteVm.sNombreController,
                            labelText: 'Segundo nombre'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController: clienteVm.apellidoController,
                            labelText: 'Apellido'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                clienteVm.sApellidoController,
                            labelText: 'Segundo Apellido'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController: clienteVm.telefonoController,
                            labelText: 'Telefono'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController: clienteVm.emailController,
                            labelText: 'Email'),
                        const Separator(size: 2),

                        CustomTextField(
                            textEditingController:
                                clienteVm.direccionController,
                            labelText: 'Direccion'),
                        const Separator(size: 2),

                        //drop
                        CustomDropDownButtom(
                            list: clienteVm.listaCiudades,
                            selectedValue:
                                clienteVm.selectCiudadController.value,
                            onChanged: (value) {
                              clienteVm.selectCiudadController.value = value;
                              clienteVm.selectCiudadId.value = clienteVm
                                  .listaCiudades
                                  .firstWhere(
                                      (element) => element.descripcion == value)
                                  .id!;
                            }),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            clienteVm.loadData.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await clienteVm.crearCliente();
                      },
                      text: 'Crear Cliente',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        await clienteVm.actualizarCliente();
                      },
                      text: 'Actualizar Cliente',
                      backgroundColor: ConstColors.principalBlue,
                      width: Get.width * 0.7,
                    ),
                  )
          ],
        ));
  }
}
