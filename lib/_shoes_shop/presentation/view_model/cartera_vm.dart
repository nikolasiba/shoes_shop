import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cartera.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/cartera_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/cartera_repo.dart';

class CarteraViewModel extends GetxController {
  final CarteraService carteraService = CarteraService(CarteraRepository());

  RxList<Cartera> carteras = <Cartera>[].obs;

  static CarteraViewModel get findOrInitialize {
    try {
      return Get.find<CarteraViewModel>();
    } catch (e) {
      Get.put(CarteraViewModel());
      return Get.find<CarteraViewModel>();
    }
  }

  get loadData => null;

  Future<void> getCartera() async {
    carteras.value = await carteraService.getCartera();
  }

  deleteCartera(param0) {}

  setearCampos(element) {}

  void clearFields() {}
}
