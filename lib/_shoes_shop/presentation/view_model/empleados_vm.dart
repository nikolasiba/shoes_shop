import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/empleados_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/empleado_repo.dart';
import 'package:shoes_shop/shared/widgets/custom_alert.dart';

class EmpleadosViewModel extends GetxController {
  final EmpleadosService empleadosService =
      EmpleadosService(EmpleadoRepository());
  //
  TextEditingController cedulaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController sNombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController sApellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  //
  RxList<GeneralModel> listaCargos = <GeneralModel>[].obs;
  RxList<GeneralModel> listaCiudades = <GeneralModel>[].obs;
  RxList<GeneralModel> listaAlmacenes = <GeneralModel>[].obs;

  //
  RxString selectCiudadController = ''.obs;
  RxString selectCargoController = ''.obs;
  RxString selectAlmacenController = ''.obs;

  RxInt selectAlma = 0.obs;
  RxInt selectCiudad = 0.obs;
  RxInt selectCargo = 0.obs;

  RxBool loadData = true.obs;

//
  RxList<Empleado> listaEmpleado = <Empleado>[].obs;

  Future<void> getEmpleados() async {
    listaEmpleado.value = await empleadosService.getEmpleados();
  }

  // Future<void> addEmpleado(Empleado empleado) async {
  //   await empleadosService.addEmpleado(empleado);
  // }
  Future<void> deleteEmpleado(int id) async {
    if (await empleadosService.deleteEmpleado(id)) {
      listaEmpleado.removeWhere((element) => element.id == id);
      CustomAlert(title: 'Exito', body: 'Empleado eliminado con exito');
    } else {
      CustomAlert(title: 'Error', body: 'No se pudo eliminar empleado');
    }
  }

  ///
  static EmpleadosViewModel get findOrInitialize {
    try {
      return Get.find<EmpleadosViewModel>();
    } catch (e) {
      Get.put(EmpleadosViewModel());
      return Get.find<EmpleadosViewModel>();
    }
  }

  customOnchanges(String value, int controller) {
    switch (controller) {
      case 1:
        selectCargoController.value = value;
        selectCargo.value = listaCargos
            .firstWhere((element) => element.descripcion == value)
            .id!;
        break;
      case 2:
        selectAlmacenController.value = value;
        selectAlma.value = listaAlmacenes
            .firstWhere((element) => element.descripcion == value)
            .id!;
        break;
      case 3:
        selectCiudadController.value = value;
        selectCiudad.value = listaCiudades
            .firstWhere((element) => element.descripcion == value)
            .id!;
        break;
      default:
    }
  }

  Future<void> getCiudades() async {
    listaCiudades.value = await empleadosService.getCiudades();
    listaCiudades.insert(
        0, GeneralModel(id: 0, descripcion: 'Seleccione una ciudad'));
    selectCiudadController.value = listaCiudades.first.descripcion!;
  }

  Future<void> getAlmacenes() async {
    listaAlmacenes.value = await empleadosService.getAlmacen();
    listaAlmacenes.insert(
        0, GeneralModel(id: 0, descripcion: 'Seleccione un almacen'));
    selectAlmacenController.value = listaAlmacenes.first.descripcion!;
  }

  Future<void> getCargos() async {
    listaCargos.value = await empleadosService.getCargos();
    listaCargos.insert(
        0, GeneralModel(id: 0, descripcion: 'Seleccione un cargo'));
    selectCargoController.value = listaCargos.first.descripcion!;
  }

  Future<void> crearEmpleado() async {
    Empleado empleado = Empleado(
      id: int.parse(cedulaController.text),
      nombre: nombreController.text,
      sNombre: sNombreController.text,
      apellido: apellidoController.text,
      sApellido: sApellidoController.text,
      telefono: telefonoController.text,
      email: emailController.text,
      direccion: direccionController.text,
      cargo: '${selectCargo.value}',
      ciudad: '${selectCiudad.value}',
      idAlmacen: selectAlma.value,
    );
    if (await empleadosService.crearEmpleado(empleado)) {
      await getEmpleados();
      clearFields();

      CustomAlert(
        title: 'Exito',
        body: 'Empleado creado con exito',
        onPressed: () async {
          Get.close(3);
        },
      );
    } else {
      CustomAlert(title: 'Error', body: 'No se pudo crear empleado');
    }
  }

  clearFields() {
    cedulaController.text = '';
    nombreController.text = '';
    sNombreController.text = '';
    apellidoController.text = '';
    sApellidoController.text = '';
    telefonoController.text = '';
    emailController.text = '';
    direccionController.text = '';
    selectCargoController.value = listaCargos.first.descripcion!;
    selectCiudadController.value = listaCiudades.first.descripcion!;
    selectAlmacenController.value = listaAlmacenes.first.descripcion!;
  }

  Future<void> setearCampos(Empleado empleado) async {
    loadData.value = false;
    await getCargos();
    await getCiudades();
    await getAlmacenes();

    cedulaController.text = empleado.id.toString();
    nombreController.text = empleado.nombre!;
    sNombreController.text = empleado.sNombre!;
    apellidoController.text = empleado.apellido!;
    sApellidoController.text = empleado.sApellido!;
    telefonoController.text = empleado.telefono!;
    emailController.text = empleado.email!;
    direccionController.text = empleado.direccion!;
    selectCargoController.value = listaCargos
        .firstWhere((element) => element.descripcion == empleado.cargo!)
        .descripcion!;
    selectCiudadController.value = listaCiudades
        .firstWhere((element) => element.descripcion == empleado.ciudad!)
        .descripcion!;
    selectAlmacenController.value = listaAlmacenes
        .firstWhere((element) => element.id == empleado.idAlmacen)
        .descripcion!;

    selectCargo.value = listaCargos
        .firstWhere((element) => element.descripcion == empleado.cargo!)
        .id!;
    selectCiudad.value = listaCiudades
        .firstWhere((element) => element.descripcion == empleado.ciudad!)
        .id!;
    selectAlma.value = listaAlmacenes
        .firstWhere((element) => element.id == empleado.idAlmacen)
        .id!;
  }

  Future<void> actualizarEmpleado() async {
    Empleado empleado = Empleado(
      id: int.parse(cedulaController.text),
      nombre: nombreController.text,
      sNombre: sNombreController.text,
      apellido: apellidoController.text,
      sApellido: sApellidoController.text,
      telefono: telefonoController.text,
      email: emailController.text,
      direccion: direccionController.text,
      cargo: '${selectCargo.value}',
      ciudad: '${selectCiudad.value}',
      idAlmacen: selectAlma.value,
    );
    if (await empleadosService.actualizarEmpleado(empleado)) {
      await getEmpleados();
      clearFields();

      CustomAlert(
        title: 'Exito',
        body: 'Empleado actualizado con exito',
        onPressed: () async {
          Get.close(3);
        },
      );
    } else {
      CustomAlert(title: 'Error', body: 'No se pudo actualizar empleado');
    }
  }
}
