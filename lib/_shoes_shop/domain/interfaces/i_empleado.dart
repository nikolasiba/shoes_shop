import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';

abstract class IEmpleado {
  Future<List<Empleado>> getEmpleados();

  Future<bool> deleteEmpleado(int id);

  Future<List<GeneralModel>> getDepartamentos();

  Future<List<GeneralModel>> getCiudades();

  Future<List<GeneralModel>> getCargos();

  Future<List<GeneralModel>> getAlmacen();

  Future<bool> crearEmpleado(Empleado empleado);

  Future<bool> actualizarEmpleado(Empleado empleado);
}
