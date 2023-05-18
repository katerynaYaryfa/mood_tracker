import 'package:flutter/material.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';
import 'package:mood_tracker/services/storage_service.dart';

class PinProvider extends ChangeNotifier {
  PinProvider({required StorageService storage}) : _storage = storage;

  final StorageService _storage;

  bool isPressed = false;
  String pin1 = '';
  String pin2 = '';
  bool wrongPin = false;
  bool pinCodeEnabled = false;
  final int pinLength = 4;

  void deletePin() {
    _storage.delete(
      key: pinKey,
    );
  }

  void clearState() {
    pin1 = '';
    pin2 = '';
    wrongPin = false;
    isPressed = false;
  }

  Future<String?> readSavedPinCode() async {
    var storage = StorageService();
    final savedPin = await storage.read(
      key: 'pin',
    );

    return savedPin;
  }

  void checkPinCode(String num) async {
    if (pin1.length == pinLength) {
      pin2 = pin2 + num;
      wrongPin = false;
    } else {
      pin1 = pin1 + num;
    }

    if (pin2.length == pinLength && pin2 != pin1) {
      pin2 = '';
      wrongPin = true;
      Future.delayed(
        const Duration(milliseconds: 1000),
        () {
          wrongPin = false;
          notifyListeners();
        },
      );
    }

    notifyListeners();
  }

  void deleteSymbol() {
    if (pin1.isNotEmpty && pin2.isEmpty) {
      pin1 = pin1.substring(0, pin1.length - 1);
    }
    if (pin1.isNotEmpty && pin2.isNotEmpty) {
      pin2 = pin2.substring(0, pin2.length - 1);
    }
    notifyListeners();
  }

  void writePin() async {
    final shouldSavePin = pin2.length == 4 && pin1 == pin2 && !pinCodeEnabled;
    if (shouldSavePin) {
      await _storage.write(
        key: pinKey,
        value: pin1,
      );

      pinCodeEnabled = true;
      notifyListeners();
    }
  }

  void readPinCode() async {
    final pin = await _storage.read(
      key: pinKey,
    );
    if (pin != null) {
      pinCodeEnabled = true;
    }
    notifyListeners();
  }

  void disablePinCode() {
    pinCodeEnabled = false;
    notifyListeners();
  }
}
