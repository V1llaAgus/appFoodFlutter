import 'package:foodapp/src/features/Domain/UseCases/Auth/UpdatePasswordUseCase/updatepassword_usecase.dart';

abstract class ForgotPasswordViewModelInput {
  late String email;
  Future<void> updatePassword();
}

abstract class ForgotPasswordViewModel extends ForgotPasswordViewModelInput {}

class DefaultForgotPasswordViewModel extends ForgotPasswordViewModel {
  //Dependencias
  final UpdatePasswordUseCase _updatePasswordUseCase;

  DefaultForgotPasswordViewModel({UpdatePasswordUseCase? updatePasswordUseCase})
      : _updatePasswordUseCase =
            updatePasswordUseCase ?? DefaultUpdatePasswordUseCase();

  @override
  Future<void> updatePassword() {
    return _updatePasswordUseCase.execute(email: email);
  }
}
