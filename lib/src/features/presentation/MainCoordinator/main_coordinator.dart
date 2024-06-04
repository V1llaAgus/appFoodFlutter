import 'package:flutter/material.dart';
import 'package:foodapp/src/features/presentation/welcome_page/View/welcome_page.dart';

import '../../../Base/Constants/local_storage_keys.dart';
import '../../Domain/UseCases/LocalStorage/fetchlocal_storageuse_case.dart';
import '../../Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';
import '../../Domain/UseCases/User/ValidateCurrentUserUseCase/validate_current_userusecase.dart';

class RoutesPaths {
  static String welcomePath = "welcome";
  static String loginPath = "login";
  static String signUpPath = "sign-up";
  static String tabsPath = "tabs";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserCase _validateCurrentUserCase;

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateCurrentUserCase? validateCurrentUserCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase =
            validateCurrentUserCase ?? DefaultValidateCurrentUserCase();

  Future<String?> start() {
    return _isUserLogged().then((value) {
      if (value != null) {
        return RoutesPaths.tabsPath;
      } else {
        return RoutesPaths.welcomePath;
      }
    });
  }

  showWelcomePage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.welcomePath);
  }

  showLoginPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.loginPath);
  }

  logoutNavigation({required BuildContext context}) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => const WelComePage(),
            transitionDuration: const Duration(seconds: 0)));
  }

  showSignUpPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.signUpPath);
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.tabsPath);
  }
}

extension PrivateMethods on MainCoordinator {
  Future<String?> _isUserLogged() async {
    var idToken = await _fetchLocalStorageUseCase.execute(
        fetchLocalParameteres:
            FetchLocalStorageParameters(key: LocalStorageKeys.idToken));

    // El usuario no está guardado en UserDefaults
    if (idToken == null) {
      return null;
    }
    // El usuario si está guardado en UserDefaults y tenemos que verificar si existe en FB
    var isUserValid = await _validateCurrentUserCase.execute(idToken: idToken);

    if (isUserValid) {
      return idToken;
    } else {
      return null;
    }
  }
}
