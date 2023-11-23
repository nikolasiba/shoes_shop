import 'package:get/get.dart';

class ProductosViewModel extends GetxController {
  ///
  ////
  ///
  /////
  ///
  ////
  ////
  ///
  ///
  ///

  static ProductosViewModel get findOrInitialize {
    try {
      return Get.find<ProductosViewModel>();
    } catch (e) {
      Get.put(ProductosViewModel());
      return Get.find<ProductosViewModel>();
    }
  }
}
