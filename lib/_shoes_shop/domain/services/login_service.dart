import 'package:shoes_shop/_shoes_shop/domain/interfaces/i_login.dart';
import 'package:shoes_shop/_shoes_shop/domain/models/login.dart';

class LoginService {
  final ILogin iLogin;

  LoginService(this.iLogin);

  Future<Login> login(
      {required String user, required String password}) async {
    return await iLogin.login(user: user, password: password);
  }
}
