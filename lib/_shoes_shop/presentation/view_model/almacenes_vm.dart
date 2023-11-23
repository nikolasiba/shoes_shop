import 'package:get/get.dart';

class AlmacenesViewModel extends GetxController {
  //
  ///
  ///
  ///
  ///
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
}
