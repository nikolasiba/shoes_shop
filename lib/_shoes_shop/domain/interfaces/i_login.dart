import 'package:shoes_shop/_shoes_shop/domain/models/empleado.dart';

///
///
///
///
abstract class ILogin {
  Future<Empleado> login({required String user, required String password});
}
