import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cartera.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/cartera_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/cartera_repo.dart';
import 'package:shoes_shop/shared/widgets/custom_alert.dart';

class CarteraViewModel extends GetxController {
  final CarteraService carteraService = CarteraService(CarteraRepository());

  RxList<Cartera> carteras = <Cartera>[].obs;
  RxList<GeneralModel> clientes = <GeneralModel>[].obs;

  static CarteraViewModel get findOrInitialize {
    try {
      return Get.find<CarteraViewModel>();
    } catch (e) {
      Get.put(CarteraViewModel());
      return Get.find<CarteraViewModel>();
    }
  }

  RxBool loadData = true.obs;

  TextEditingController deudaController = TextEditingController();
  TextEditingController idController = TextEditingController();

  RxString selectClientController = ''.obs;

  RxInt selectClient = 0.obs;

  Future<void> getCartera() async {
    carteras.value = await carteraService.getCartera();
  }

  Future<void> getClientes() async {
    clientes.value = await carteraService.getClientes();

    clientes.insert(
        0, GeneralModel(id: 0, descripcion: 'Seleccione un cliente'));

    selectClientController.value = clientes.first.descripcion!;
    selectClient.value = clientes.first.id!;
  }

  Future<void> deleteCartera(id) async {
    bool response = await carteraService.deleteCartera(id);
    if (response) {
      CustomAlert(title: 'Exito', body: 'Se elimino correctamente');
    } else {
      CustomAlert(title: 'Error', body: 'No se pudo eliminar');
    }
  }

  setearCampos(element) {
    loadData.value = false;
    idController.text = element.id.toString();
    deudaController.text = element.valor.toString();
    selectClientController.value = element.nombre;
  }

  void clearFields() {
    idController.text = '';
    deudaController.text = '';
    selectClientController.value = '';
    selectClient.value = 0;
  }

  Future<void> crearCartera() async {
    Cartera cartera = Cartera(
      id: selectClient.value,
      valor: double.parse(deudaController.text),
    );

    bool response = await carteraService.crearCartera(cartera);

    if (response) {
      CustomAlert(
          title: 'Exito',
          body: 'Se creo correctamente',
          onPressed: () {
            Get.close(3);
            clearFields();
          });
    } else {
      CustomAlert(title: 'Error', body: 'No se pudo crear');
    }
  }

  Future<void> actualizarCartera() async {
    Cartera cartera = Cartera(
      id: int.parse(idController.text),
      valor: double.parse(deudaController.text),
    );
    bool response = await carteraService.updateCartera(cartera);

    if (response) {
      CustomAlert(
          title: 'Exito',
          body: 'Se actualizo correctamente',
          onPressed: () {
            Get.close(3);
            clearFields();
          });
    } else {
      CustomAlert(title: 'Error', body: 'No se pudo actualizar');
    }
  }
}
