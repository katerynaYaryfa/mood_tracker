import 'package:flutter/material.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';
import 'package:mood_tracker/services/storage_service.dart';

class PinListenerProvider with ChangeNotifier {
  PinListenerProvider(this._storage, this._secureStorage);

  static const _pinCheckTime = 60;

  final StorageService _storage;
  final SecureStorageService _secureStorage;

  Future<bool> checkShouldShowPin() async {
    final lastLoginTime = await _storage.read(key: lastLoginTimeKey) ?? '';
    final pin = await _secureStorage.read(key: pinKey);

    final lastLoginDate =
        DateTime.fromMillisecondsSinceEpoch(int.parse(lastLoginTime));
    final shouldShowPin = pin != null &&
        DateTime.now().difference(lastLoginDate).inMinutes > _pinCheckTime;

    return shouldShowPin;
  }
}
