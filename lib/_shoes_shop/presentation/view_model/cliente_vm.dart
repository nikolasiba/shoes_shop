import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/cliente_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/cliente_repo.dart';
import 'package:shoes_shop/shared/widgets/custom_alert.dart';

class ClienteViewModel extends GetxController {
  final ClienteService clienteService = ClienteService(ClientesRepository());
  //
  RxList<Cliente> clientes = <Cliente>[].obs;

  RxBool loadData = false.obs;

  RxList<GeneralModel> listaCiudades = <GeneralModel>[].obs;

  RxString selectCiudadController = ''.obs;
  RxInt selectCiudadId = 0.obs;

  TextEditingController cedulaController = TextEditingController();

  TextEditingController nombreController = TextEditingController();

  TextEditingController sNombreController = TextEditingController();

  TextEditingController apellidoController = TextEditingController();

  TextEditingController sApellidoController = TextEditingController();

  TextEditingController telefonoController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController direccionController = TextEditingController();

  Future<void> getClients() async {
    clientes.value = await clienteService.obtenerClientes();
  }

  ///
  ////
  ///
  static ClienteViewModel get findOrInitialize {
    try {
      return Get.find<ClienteViewModel>();
    } catch (e) {
      Get.put(ClienteViewModel());
      return Get.find<ClienteViewModel>();
    }
  }

  Future<void> deleteCliente(id) async {
    bool response = await clienteService.eliminarCliente(id);

    if (response) {
      clientes.removeWhere((element) => element.id == id);
      CustomAlert(
        title: 'Exito',
        body: ' Cliente eliminado',
      );
    } else {
      CustomAlert(title: 'Error', body: ' Cliente no eliminado');
    }
  }

  Future<void> setearCampos(element) async {
    loadData.value = false;
    await getCiudades();
    cedulaController.text = element.id.toString();
    nombreController.text = element.nombre!;
    sNombreController.text = element.nombre2!;
    apellidoController.text = element.apellido!;
    sApellidoController.text = element.apellido2!;
    telefonoController.text = element.telefono!;
    emailController.text = element.email!;
    direccionController.text = element.direccion!;
    selectCiudadController.value = element.ciudad!;

    selectCiudadId.value = listaCiudades
        .firstWhere(
            (element) => element.descripcion == selectCiudadController.value)
        .id!;
  }

  void clearFields() {
    cedulaController.text = '';
    nombreController.text = '';
    sNombreController.text = '';
    apellidoController.text = '';
    sApellidoController.text = '';
    telefonoController.text = '';
    emailController.text = '';
    direccionController.text = '';
    listaCiudades.isNotEmpty
        ? selectCiudadController.value = listaCiudades.first.descripcion!
        : '';
  }

  Future<void> crearCliente() async {
    final cliente = Cliente(
        id: int.parse(cedulaController.text),
        nombre: nombreController.text,
        nombre2: sNombreController.text,
        apellido: apellidoController.text,
        apellido2: sApellidoController.text,
        telefono: telefonoController.text,
        email: emailController.text,
        direccion: direccionController.text,
        ciudad: '${selectCiudadId.value}');

    bool response = await clienteService.crearCliente(cliente);

    if (response) {
      clearFields();

      CustomAlert(
          title: 'Exito',
          body: ' Cliente creado',
          onPressed: () => Get.close(3));
    } else {
      CustomAlert(title: 'Error', body: ' Cliente no creado');
    }
  }

  Future<void> actualizarCliente() async {
    final cliente = Cliente(
        id: int.parse(cedulaController.text),
        nombre: nombreController.text,
        nombre2: sNombreController.text,
        apellido: apellidoController.text,
        apellido2: sApellidoController.text,
        telefono: telefonoController.text,
        email: emailController.text,
        direccion: direccionController.text,
        ciudad: '${selectCiudadId.value}');

    bool response = await clienteService.actualizarCliente(cliente);

    if (response) {
      clearFields();

      CustomAlert(
          title: 'Exito',
          body: ' Cliente actualizado',
          onPressed: () => Get.close(3));
    } else {
      CustomAlert(title: 'Error', body: ' Cliente no actualizado');
    }
  }

  Future<void> getCiudades() async {
    listaCiudades.value = await clienteService.obtenerCiudades();
    listaCiudades.insert(
        0, GeneralModel(id: 0, descripcion: 'Seleccione una ciudad '));

    selectCiudadController.value = listaCiudades.first.descripcion!;
  }
}
