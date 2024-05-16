import 'package:foodapp/src/features/Domain/UseCases/Auth/SignOutUseCase/signout_usecase.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';

abstract class ProfileTabViewModelInput {
  late LoadingStateProvider loadingStatusState;

  Future<void> signOut();
  void initState({required LoadingStateProvider loadingState});
}

abstract class ProfileTabViewModel extends ProfileTabViewModelInput {}

class DefaultProfileTabViewModel extends ProfileTabViewModel {
  //Dependencias

  final SignOutUseCase _signOutUseCase;

  DefaultProfileTabViewModel({SignOutUseCase? signOutUseCase})
      : _signOutUseCase = signOutUseCase ?? DefaulSignOutUseCase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() {
    loadingStatusState.setLoadingState(isLoading: true);

    return _signOutUseCase
        .execute()
        .then((_) => loadingStatusState.setLoadingState(isLoading: false));
  }
}
