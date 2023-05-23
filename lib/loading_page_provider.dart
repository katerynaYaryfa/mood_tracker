import 'package:flutter/material.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';
import 'package:mood_tracker/services/storage_service.dart';

class LoadingPageProvider with ChangeNotifier {
  LoadingPageProvider(this._storage) {
    _init();
  }

  final StorageService _storage;

  late DateTime lastLoginTime;

  bool isPasswordRequired = true;
  LoadingState state = LoadingState.loading;

  Future<void> _initPrefs() async {
    final lastLogin = await _storage.readInt(key: lastLoginTimestamp) ?? 0;
    lastLoginTime = DateTime.fromMillisecondsSinceEpoch(lastLogin);
    checkPasswordRequired();
  }

  void setIsPasswordRequiredFalse() {
    isPasswordRequired = false;
    _initPrefs();
    notifyListeners();
  }

  void checkPasswordRequired() {
    final now = DateTime.now();
    final elapsedMinutes = now.difference(lastLoginTime).inMinutes;
    isPasswordRequired = elapsedMinutes >= 60;
    _storage.writeInt(
      key: lastLoginTimestamp,
      value: now.millisecondsSinceEpoch,
    );
    notifyListeners();
  }

  void _init() async {
    _initPrefs();

    final storage = SecureStorageService();

    final pin1 = await storage.read(
      key: pinKey,
    );

    if (pin1 != null) {
      state = LoadingState.pin;
    } else {
      state = LoadingState.home;
    }

    notifyListeners();
  }
}

enum LoadingState { loading, pin, home }
