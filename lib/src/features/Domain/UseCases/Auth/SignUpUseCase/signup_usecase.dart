import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/SignUpRepository/signup_repository.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/SignUpRepository/signup_repositoryparameters.dart';
import 'package:foodapp/src/features/Domain/Entities/Auth/SignUpEntity/signupentity.dart';
import 'package:foodapp/src/features/Domain/Entities/User/user_entity.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignUpUseCase/signup_use_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/User/SaveUserDataUseCase/saveuser_datacase_parameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/User/SaveUserDataUseCase/saveuser_datausecase.dart';
import 'package:foodapp/src/utils/Helpers/Dates/date_helpers.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';
import 'package:foodapp/src/utils/Helpers/UserPhotho/user_photo_helper.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {
  //Dependencia
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase(
      {SignUpRepository? signUpRepository,SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute( {required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(
            params: SignUpRepositoryParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:

          //null check
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());

          //aguardamos el nuevo usuario en la base de datos
          return saveUseDataInDataBase(params: params, entity: entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUseDataInDataBase(
      {required SignUpUseCaseParameters params, required SignUpEntity entity}) {
    SaveUserDataUseCaseParameters saveparams = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        role: UserRole.user,
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: UserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken);

    return _saveUserDataUseCase.execute(params: saveparams).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}