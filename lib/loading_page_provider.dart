import 'package:flutter/material.dart';
import 'package:mood_tracker/services/storage_service.dart';

class LoadingPageProvider with ChangeNotifier {
  LoadingPageProvider() {
    _init();
  }

  LoadingState state = LoadingState.loading;

  void _init() async {
    final storage = StorageService();
    final pin1 = await storage.read(
      key: 'pin',
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
