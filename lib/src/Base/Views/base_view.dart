import 'package:flutter/material.dart';
import 'package:foodapp/src/Base/Views/loading_view.dart';
import 'package:foodapp/src/features/presentation/MainCoordinator/main_coordinator.dart';
import 'package:foodapp/src/features/presentation/StateProviders/error_state_provider.dart';

class BaseView {
  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = const LoadingView();

  final ErrorStateProvider errorStateProdiver = ErrorStateProvider();
}
