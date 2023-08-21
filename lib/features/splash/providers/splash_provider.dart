import 'package:flutter/material.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';

enum SplashState { loading, pin, home }

class SplashProvider with ChangeNotifier {
  SplashProvider(this._storage);

  SplashState state = SplashState.loading;

  final SecureStorageService _storage;

  Future<void> checkShouldShowPin() async {
    final pin = await _storage.read(key: pinKey);

    state = pin != null ? SplashState.pin : SplashState.home;

    notifyListeners();
  }
}
