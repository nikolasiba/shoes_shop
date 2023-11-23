import 'package:shoes_shop/_shoes_shop/domain/models/cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';

abstract class ICliente {
  Future<bool> crearClietne(dynamic cliente);

  Future<bool> actualizarCliente(dynamic cliente);

  Future<bool> eliminarCliente(dynamic cliente);

  Future<List<Cliente>> obtenerClientes();

  Future<List<GeneralModel>> obtenerCiudades();
}
