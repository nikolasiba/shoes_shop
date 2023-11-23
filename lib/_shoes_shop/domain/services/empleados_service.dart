import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';

class EmpleadosService {
  final IEmpleado iEmpleado;

  EmpleadosService(this.iEmpleado);

  Future<dynamic> getEmpleados() async {
    return await iEmpleado.getEmpleados();
  }

  Future<bool> deleteEmpleado(int id) async {
    return await iEmpleado.deleteEmpleado(id);
  }

  Future<List<GeneralModel>> getDepartamentos() {
    return iEmpleado.getDepartamentos();
  }

  Future<List<GeneralModel>> getCiudades() {
    return iEmpleado.getCiudades();
  }

  Future<List<GeneralModel>> getCargos() {
    return iEmpleado.getCargos();
  }

  Future<bool> crearEmpleado(Empleado empleado) {
    return iEmpleado.crearEmpleado(empleado);
  }

  Future<List<GeneralModel>> getAlmacen() {
    return iEmpleado.getAlmacen();
  }

  Future<bool> actualizarEmpleado(Empleado empleado) {
    return iEmpleado.actualizarEmpleado(empleado);
  }
}
