import 'package:flutter/material.dart';
import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/local_storage_keys.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignUpUseCase/signup_use_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignUpUseCase/signup_usecase.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/savelocal_storageuse_case.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/TextFormFields/customtext_fotmfield.dart';
import 'package:foodapp/src/features/presentation/sing_up_page/Model/sign_up_model.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class SignUpViewModelInput {
  late LoadingStateProvider loadingState;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;

  SignUpModel? signUpModel = SignUpModel();

  void initState({required LoadingStateProvider loadingStateProvider});

  Future<Result<bool, Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput
    with TextFormFieldDelegate {
  get singUpModel => null;
}

class DefaultSignUpViewModel extends SignUpViewModel {
  //DEPENDENCIAS

  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel(
      {SignUpUseCase? signUpUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = LoadingStateProvider();
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> signUp() async {
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase
        .execute(
            params: SignUpUseCaseParameters(
                username: signUpModel?.username ?? "",
                email: signUpModel?.email ?? "",
                password: signUpModel?.password ?? "",
                phone: signUpModel?.phone ?? "",
                date: signUpModel?.date))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          _saveLocalStorageUseCase.execute(
              parameters: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ""));

          loadingState.setLoadingState(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;

      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;

      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;

      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;

      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
    }
  }
}
