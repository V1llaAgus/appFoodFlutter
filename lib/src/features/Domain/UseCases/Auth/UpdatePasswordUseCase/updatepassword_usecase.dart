import 'package:foodapp/src/features/Data/Repositories/Auth/UpdatePassword/updatepassword_repository.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';

abstract class UpdatePaswordUseCase {
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePaswordUseCase {
  //DEPENDENCIAS
  UpdatePasswordRepository updatePasswordRepository;

  DefaultUpdatePasswordUseCase(
      UpdatePasswordRepository? updatePasswordRepository)
      : updatePasswordRepository =
            updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) {
    return updatePasswordRepository.updatePassword(email: email);
  }
}
