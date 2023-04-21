import 'package:flutter/material.dart';
import 'package:mood_tracker/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPageProvider with ChangeNotifier {
  LoadingPageProvider() {
    _init();
  }

  late SharedPreferences _prefs;
  late DateTime lastLoginTime;
  bool isPasswordRequired = false;

  LoadingState state = LoadingState.loading;

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final lastLoginTimestamp = _prefs.getInt('last_login_timestamp') ?? 0;
    lastLoginTime = DateTime.fromMillisecondsSinceEpoch(lastLoginTimestamp);
    _checkPasswordRequired();
    print(lastLoginTime);
  }

  void _checkPasswordRequired() {
    final now = DateTime.now();
    final elapsedMinutes = now.difference(lastLoginTime).inMinutes;
    isPasswordRequired = elapsedMinutes >= 1;
    print('isPasswordRequired in void == $isPasswordRequired');
    _prefs.setInt('last_login_timestamp', now.millisecondsSinceEpoch);
    notifyListeners();
  }

  void _init() async {
    _initPrefs();

    final storage = StorageService();

    final pin1 = await storage.read(
      key: 'pin',
    );

    if (pin1 != null) {
      state = LoadingState.pin;
    } else {
      state = LoadingState.home;
    }
    print('INIT isPasswordRequired _____ =$isPasswordRequired');

    notifyListeners();
  }
}

enum LoadingState { loading, pin, home }
