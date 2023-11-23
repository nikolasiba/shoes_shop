import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/almacen.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/almacen_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/almacen_repo.dart';
import 'package:shoes_shop/shared/widgets/custom_alert.dart';

class AlmacenesViewModel extends GetxController {
  final AlmacenService almacenService = AlmacenService(AlmacenRepository());

  RxList<Almacen> almacenes = <Almacen>[].obs;
  RxList<GeneralModel> ciudades = <GeneralModel>[].obs;

  RxInt selectCiudad = 0.obs;
  RxString selectCiudadController = ''.obs;

  RxBool loadData = true.obs;

  TextEditingController cedulaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController direccionController = TextEditingController();

  Future<void> getAlmacenes() async {
    almacenes.value = await almacenService.getAlmacenes();
  }

  ///
  ///
  ///
  static AlmacenesViewModel get findOrInitialize {
    try {
      return Get.find<AlmacenesViewModel>();
    } catch (e) {
      Get.put(AlmacenesViewModel());
      return Get.find<AlmacenesViewModel>();
    }
  }

  Future<void> deleteAlmacen(id) async {
    bool response = await almacenService.deleteAlmacen(id);
    if (response) {
      await getAlmacenes();
      CustomAlert(title: 'Succes', body: 'Almacen eliminado correctamente');
    } else {
      CustomAlert(title: 'Error', body: 'Error al eliminar almacen');
    }
  }

  Future<void> getCiudades() async {
    ciudades.value = await almacenService.getCiudades();

    if (ciudades.isNotEmpty) {
      selectCiudadController.value = ciudades.first.descripcion!;
    }
  }

  Future<void> crearAlmacen() async {
    Almacen almacen = Almacen(
        nombre: nombreController.text,
        direccion: nombreController.text,
        ciudad: '${selectCiudad.value}');

    bool response = await almacenService.createAlmacen(almacen);
    if (response) {
      CustomAlert(
          title: 'Succes',
          body: 'Almacen creado correctamente',
          onPressed: () async {
            clearFields();
            Get.close(2);
            await getAlmacenes();
          });
    } else {
      CustomAlert(title: 'Error', body: 'Error al crear almacen');
    }
  }

  Future<void> actualizarAlmacen() async {
    Almacen almacen = Almacen(
      id: int.parse(cedulaController.text),
      nombre: nombreController.text,
      direccion: direccionController.text,
      ciudad: '${selectCiudad.value}',
    );

    bool response = await almacenService.updateAlmacen(almacen);
    if (response) {
      CustomAlert(title: 'Succes', body: 'Almacen actualizado correctamente');
    } else {
      CustomAlert(title: 'Error', body: 'Error al actualizar almacen');
    }
  }

  void clearFields() {
    cedulaController.text = '';
    nombreController.text = '';
    direccionController.text = '';
    selectCiudadController.value = '';
  }

  Future<void> setearCampos(Almacen element) async {
    loadData.value = false;
    await getCiudades();
    cedulaController.text = element.id.toString();
    nombreController.text = element.nombre!;
    direccionController.text = element.direccion!;
    selectCiudadController.value = element.ciudad!;
    selectCiudad.value = ciudades
        .firstWhere(
            (element) => element.descripcion == selectCiudadController.value)
        .id!;
  }
}
