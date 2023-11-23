import 'package:shoes_shop/_shoes_shop/domain/models/cartera.dart';

abstract class ICartera {
  Future<bool> createCartera(dynamic cartera);

  Future<bool> updateCartera(dynamic cartera);

  Future<bool> deleteCartera(dynamic cartera);

  Future<List<Cartera>> getCartera();
}
