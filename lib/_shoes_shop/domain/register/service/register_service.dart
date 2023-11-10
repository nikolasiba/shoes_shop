import 'package:shoes_shop/_shoes_shop/domain/register/interface/i_register.dart';
import 'package:shoes_shop/_shoes_shop/domain/register/model/aspirante_model.dart';

class RegisterService {
  final IRegister iRegister;

  RegisterService({required this.iRegister});

  Future<bool> registerUser(Candidate candidate) async {
    return await iRegister.registerUser(candidate);
  }
}
