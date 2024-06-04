import 'package:flutter/material.dart';
import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/local_storage_keys.dart';
import 'package:foodapp/src/Base/Views/base_view.dart';

import 'package:foodapp/src/features/Domain/UseCases/Auth/SignInUseCase/signin_usecase.dart';

import 'package:foodapp/src/features/Domain/UseCases/Auth/SignInUseCase/signin_usecase_bodyparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/savelocal_storageuse_case.dart';

import 'package:foodapp/src/features/presentation/LoginPage/Model/login_model.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/TextFormFields/customtext_fotmfield.dart';

import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class LoginViewModelInput {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');

  Future<Result<bool, Failure>> login(
      {required String email, required String password});
  bool isFormValidate();
}

abstract class LoginViewModel extends LoginViewModelInput
    with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {
  // * Dependencies
  // * UseCases
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // * Constructor
  DefaultLoginViewModel(
      {SignInUseCase? signInUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  // * Init State
  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  // Utils

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  // User Actions
  @override
  Future<Result<bool, Failure>> login(
      {required String email, required String password}) {
    loadingState.setLoadingState(isLoading: true);

    return _signInUseCase
        .execute(
            params: SignInUseCaseParameters(email: email, password: password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          loadingState.setLoadingState(isLoading: false);
          _saveLocalStorageUseCase.execute(
              parameters: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ""));

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
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        break;
      case CustomTextFormFieldType.phone:
        break;
      case CustomTextFormFieldType.dateOfBirth:
        break;
    }
  }
}
