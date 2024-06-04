import 'package:flutter/material.dart';
import 'package:foodapp/src/Base/Views/loading_view.dart';

import 'package:foodapp/src/features/presentation/StateProviders/error_state_provider.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';

import '../../features/presentation/MainCoordinator/main_coordinator.dart';

class BaseView {
  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = const LoadingView();
  final ErrorStateProvider errorStateProdiver = ErrorStateProvider();
}

abstract class BaseViewModel {
  late LoadingStateProvider loadingState;
  void initState({required LoadingStateProvider loadingStateProvider});
}
