import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.loading;
  bool _isDisposed = false;

  ViewState get viewState => _state;

  void _setState(ViewState viewState) {
    if (_isDisposed) return;
    _state = viewState;
    notifyListeners();
  }

  void notifyListener() {
    if (_isDisposed) return;
    notifyListeners();
  }

  void setLoadingState() => _setState(ViewState.loading);

  void setSuccessState() => _setState(ViewState.success);

  void setErrorState() => _setState(ViewState.error);

  bool get isStateLoading => _state == ViewState.loading;

  bool get isStateSuccess => _state == ViewState.success;

  bool get isStateError => _state == ViewState.error;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
