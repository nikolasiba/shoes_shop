import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/options_model.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/almacenes_pg.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/cartera_pg.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/clientes_pg.dart';
import 'package:shoes_shop/_shoes_shop/presentation/views/empleados_pg.dart';
import 'package:shoes_shop/shared/assets/assets.dart';

class HomeViewModel extends GetxController {
  RxList<OptionsModel> options = <OptionsModel>[].obs;

  static HomeViewModel get findOrInitialize {
    try {
      return Get.find<HomeViewModel>();
    } catch (e) {
      Get.put(HomeViewModel());
      return Get.find<HomeViewModel>();
    }
  }

  void fullOptions() {
    options.value = [
      OptionsModel('Empleados', Res.images.empleado, () {
        Get.to(() => EmpleadosPage());
      }),
      OptionsModel('Clientes', Res.images.oferts, () {
        Get.to(() => ClientesPAge());
      }),
      // OptionsModel('Facturas', Res.images.invoice, () {
      //   Get.to(() => FacturasPage());
      // }),
      // OptionsModel('Productos', Res.images.product, () {
      //   Get.to(() => ProductosPAge());
      // }),
      OptionsModel('Almacenes', Res.images.almacen, () {
        Get.to(() => AlmacenesPAge());
      }),
      OptionsModel('Cartera', Res.images.references, () {
        Get.to(() => CarteraPage());
      }),
    ];
  }
}
