import 'package:shoes_shop/_shoes_shop/domain/register/model/aspirante_model.dart';
import 'package:shoes_shop/_shoes_shop/domain/request/interface/i_request.dart';

class RequestService {
  final IRequest iRequest;

  RequestService(this.iRequest);

  Future<List<Candidate>> getRequest() async {
    return await iRequest.getRequest();
  }

  Future<bool> deeltedRequest({required String id}) async {
    return await iRequest.deeltedRequest(id: id);
  }

  Future<bool> updateRequest({required Candidate candidate}) async {
    return await iRequest.updateRequest(candidate: candidate);
  }
}