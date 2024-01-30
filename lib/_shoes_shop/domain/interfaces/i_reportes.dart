abstract class IReportes {
  Future<List<dynamic>> reporteEmpleados();
  Future<List<dynamic>> reporteClientes();
  Future<List<dynamic>> reporteProductos();
  Future<List<dynamic>> reportUsuariosRegistrados();
  Future<List<dynamic>> reporteFacturas();
}
