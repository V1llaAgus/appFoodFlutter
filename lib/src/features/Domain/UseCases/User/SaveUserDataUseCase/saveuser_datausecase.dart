

import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/features/Data/Repositories/User/saveuser_datarepository.dart';
import 'package:foodapp/src/features/Data/Repositories/User/userbody_parameters.dart';
import 'package:foodapp/src/features/Domain/Entities/User/user_entity.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/features/Domain/UseCases/User/SaveUserDataUseCase/saveuser_datacase_parameters.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params });
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {

  // * Dependencies
  final SaveUserDataRepository _saveUserDataRepository;
    
  DefaultSaveUserDataUseCase({ SaveUserDataRepository? saveUserDataRepository }) 
               : _saveUserDataRepository = saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params }) {

    UserBodyParameters parameters = UserBodyParameters(
        localId: params.localId,
        role: params.role?.toShortString(),
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.dateOfBirth,
        startDate: params.startDate,
        photo: params.photo,
        shippingAddress: params.shippingAddress,
        billingAddress: params.billingAddress,
        idToken: params.idToken);

    return _saveUserDataRepository.saveUserData(params: parameters)
        .then((result) {
              switch (result.status) {
                case ResultStatus.success:
                  if(result.value == null) {
                    return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
                  }
                  var entity = UserEntity.fromMap(result.value!.toMap());
                  return Result.success(entity);
                case ResultStatus.error:
                  return Result.failure(result.error);
              }
        });
  }
}
