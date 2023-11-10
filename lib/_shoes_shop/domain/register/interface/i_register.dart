import 'package:shoes_shop/_shoes_shop/domain/register/model/aspirante_model.dart';

abstract class IRegister {
  Future<bool> registerUser(Candidate candidate);
}
