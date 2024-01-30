import 'package:get/get.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cliente.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/cuenta_reporte.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/empleado_reporte.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/factura.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/general_models.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/producto_reporte.dart';
import 'package:shoes_shop/_shoes_shop/domain/services/reportes_service.dart';
import 'package:shoes_shop/_shoes_shop/infraestructure/repositorys/reportes_repo.dart';

class ReportesViewModel extends GetxController {
  final ResportesService resportesService =
      ResportesService(ReportesRepository());
  //
  RxList<EmpleadoReporte> responseEmpleado = <EmpleadoReporte>[].obs;
  RxList<ProductoReporte> responseProducto = <ProductoReporte>[].obs;
  RxList<Cliente> responseCliente = <Cliente>[].obs;
  RxList<CuentaReporte> responseCuentas = <CuentaReporte>[].obs;
  RxList<Factura> responseFacturas = <Factura>[].obs;

  RxString selectedReportType = ''.obs;

  dynamicOnchange() async {
    switch (selectedReportType.value) {
      case 'Reporte de Empleados por almacen':
        await getEmpleadosReporte();
        break;
      case 'Reporte de productos':
        await getProductosReporte();
        break;
      case 'Reporte de clientes':
        await getClientesReporte();
        break;
      case 'Reporte de cuentas':
        await getUsuariosReporte();
        break;
      case 'Reporte de facturas':
        await getFacturasReporte();
        break;
      case 'Reporte de compras':
        break;
      case 'Reporte de inventario':
        break;
      case 'Reporte de caja':
        break;
      case 'Reporte de gastos':
        break;
      case 'Reporte de deudas':
        break;
      default:
    }
  }

  Future getEmpleadosReporte() async {
    responseEmpleado.value =
        await resportesService.reporteEmpleados() as List<EmpleadoReporte>;
  }

  Future getProductosReporte() async {
    responseProducto.value =
        await resportesService.reporteProductos() as List<ProductoReporte>;
  }

  Future getClientesReporte() async {
    responseCliente.value =
        await resportesService.reporteClientes() as List<Cliente>;
  }

  Future getUsuariosReporte() async {
    responseCuentas.value = await resportesService.reportUsuariosRegistrados()
        as List<CuentaReporte>;
  }

  Future getFacturasReporte() async {
    responseFacturas.value =
        await resportesService.reporteFacturas() as List<Factura>;
  }

  ///
  List<GeneralModel> reportsTypeList = [
    GeneralModel(id: 0, descripcion: 'Seleccione un tipo de reporte'),
    GeneralModel(id: 1, descripcion: 'Reporte de Empleados por almacen'),
    GeneralModel(id: 2, descripcion: 'Reporte de productos'),
    GeneralModel(id: 3, descripcion: 'Reporte de clientes'),
    GeneralModel(id: 4, descripcion: 'Reporte de cuentas'),
    //
    GeneralModel(id: 5, descripcion: 'Reporte de facturas'),
    GeneralModel(id: 6, descripcion: 'Reporte de compras'),
    GeneralModel(id: 7, descripcion: 'Reporte de inventario'),
    GeneralModel(id: 8, descripcion: 'Reporte de caja'),
    GeneralModel(id: 9, descripcion: 'Reporte de gastos'),
    GeneralModel(id: 10, descripcion: 'Reporte de deudas'),
  ];
  ////

  ///
  ///
  ///
  static ReportesViewModel get findOrInitialize {
    try {
      return Get.find<ReportesViewModel>();
    } catch (e) {
      Get.put(ReportesViewModel());
      return Get.find<ReportesViewModel>();
    }
  }
}
