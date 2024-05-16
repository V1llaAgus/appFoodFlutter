import 'package:flutter/material.dart';

abstract class LoadingStateProviderDelegate {
  bool isLoading = false;

  void setLoadingState({required bool isLoading});
}

class LoadingStateProvider extends ChangeNotifier with LoadingStateProviderDelegate {
  @override
  void setLoadingState({required bool isLoading}) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}
