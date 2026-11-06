import 'package:uniqswims_shared/uniqswims_shared.dart';

class SaveLeadUseCase {
  final ILeadRepository _repository;

  SaveLeadUseCase(this._repository);

  Future<String> call(LeadModel lead) async {
    return await _repository.saveLead(lead);
  }
}