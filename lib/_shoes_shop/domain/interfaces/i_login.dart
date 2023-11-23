import 'package:shoes_shop/_shoes_shop/domain/models/login.dart';

///
///
///
///
abstract class ILogin {
  Future<Login> login({required String user, required String password});
}
