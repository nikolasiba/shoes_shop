import 'package:get/get.dart';

class ClienteViewModel extends GetxController {
  //

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
}
