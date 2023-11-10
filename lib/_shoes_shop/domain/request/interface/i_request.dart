import 'package:shoes_shop/_shoes_shop/domain/register/model/aspirante_model.dart';

abstract class IRequest {
  Future<List<Candidate>> getRequest();
  Future<bool> deeltedRequest({required String id});
  Future<bool> updateRequest({required Candidate candidate});
}
