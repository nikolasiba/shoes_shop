import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_reportes.dart';

class ResportesService {
  final IReportes iReportesService;

  ResportesService(this.iReportesService);

  Future<List<dynamic>> reporteEmpleados() async {
    return await iReportesService.reporteEmpleados();
  }

  Future<List<dynamic>> reporteClientes() async {
    return await iReportesService.reporteClientes();
  }

  Future<List<dynamic>> reporteProductos() async {
    return await iReportesService.reporteProductos();
  }

  Future<List<dynamic>> reportUsuariosRegistrados() async {
    return await iReportesService.reportUsuariosRegistrados();
  }

  Future<List<dynamic>> reporteFacturas() async {
    return await iReportesService.reporteFacturas();
  }
}
