import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';

class ClienteService {
  final ICliente iCliente;

  ClienteService(this.iCliente);

  Future<bool> crearCliente(dynamic cliente) async {
    return await iCliente.crearClietne(cliente);
  }

  Future<bool> actualizarCliente(dynamic cliente) async {
    return await iCliente.actualizarCliente(cliente);
  }

  Future<bool> eliminarCliente(dynamic id) async {
    return await iCliente.eliminarCliente(id);
  }

  Future<List<Cliente>> obtenerClientes() async {
    return await iCliente.obtenerClientes();
  }

  Future<List<GeneralModel>> obtenerCiudades() async {
    return await iCliente.obtenerCiudades();
  }
}
