import 'package:flutter/material.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';

enum SplashState { loading, pin, home }

class SplashProvider with ChangeNotifier {
  SplashProvider(this._storage);

  final SecureStorageService _storage;

  SplashState state = SplashState.loading;

  Future<void> checkShouldShowPin() async {
    final pin = await _storage.read(key: pinKey);

    if (pin != null) {
      state = SplashState.pin;
    } else {
      state = SplashState.home;
    }

    notifyListeners();
  }
}
