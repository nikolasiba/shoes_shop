import 'package:get/get.dart';

class FacturasViewModel extends GetxController {
  ///
  ///
  ////
  ////
  ////

  static FacturasViewModel get findOrInitialize {
    try {
      return Get.find<FacturasViewModel>();
    } catch (e) {
      Get.put(FacturasViewModel());
      return Get.find<FacturasViewModel>();
    }
  }
}
