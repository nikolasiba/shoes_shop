import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_cartera.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cartera.dart';

class CarteraService {
  final ICartera iCarteraService;

  CarteraService(this.iCarteraService);

  Future<bool> crearCartera(dynamic cartera) async {
    return await iCarteraService.createCartera(cartera);
  }

  Future<bool> updateCartera(dynamic cartera) async {
    return await iCarteraService.updateCartera(cartera);
  }

  Future<bool> deleteCartera(dynamic cartera) async {
    return await iCarteraService.deleteCartera(cartera);
  }

  Future<List<Cartera>> getCartera() async {
    return await iCarteraService.getCartera();
  }
}
