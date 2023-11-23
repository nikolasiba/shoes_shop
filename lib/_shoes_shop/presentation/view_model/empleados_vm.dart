import 'package:get/get.dart';

class EmpleadosViewModel extends GetxController {
  ///
  ////
  ////
  ////
  ////
  ////
  ////
  ////
  ///
  static EmpleadosViewModel get findOrInitialize {
    try {
      return Get.find<EmpleadosViewModel>();
    } catch (e) {
      Get.put(EmpleadosViewModel());
      return Get.find<EmpleadosViewModel>();
    }
  }
}
