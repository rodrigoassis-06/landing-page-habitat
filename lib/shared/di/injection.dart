import 'package:get_it/get_it.dart';
import 'package:uniqswims_shared/uniqswims_shared.dart';
import 'package:uniqswims_lp/features/lead_capture/domain/usecases/save_lead_usecase.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Registra o UseCase da LP 
  // O GetIt vai buscar o ILeadRepository que foi registrado pelo SharedInject
  getIt.registerLazySingleton(
    () => SaveLeadUseCase(getIt<ILeadRepository>()),
  );
}