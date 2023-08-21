import 'package:flutter/material.dart';
import 'package:mood_tracker/services/secure_storage_service.dart';
import 'package:mood_tracker/services/storage_service.dart';

class PinProvider with ChangeNotifier {
  PinProvider(this._secureStorageService, this._storageService) {
    init();
  }

  bool isPressed = false;
  String pin1 = '';
  String pin2 = '';
  bool wrongPin = false;
  String myCode = '';

  final SecureStorageService _secureStorageService;
  final StorageService _storageService;

  void clearState() {
    pin1 = '';
    pin2 = '';
    wrongPin = false;
    isPressed = false;
  }

  Future<void> pinCode(String num) async {
    if (pin1.length == 4) {
      pin2 = pin2 + num;
      wrongPin = false;
    } else {
      pin1 = pin1 + num;
    }
    if (pin2.length == 4 && pin2 != pin1) {
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

  void deleteLastIndex() {
    if (pin1.isNotEmpty && pin2.isEmpty) {
      pin1 = pin1.substring(0, pin1.length - 1);
    }
    if (pin1.isNotEmpty && pin2.isNotEmpty) {
      pin2 = pin2.substring(0, pin2.length - 1);
    }
    notifyListeners();
  }

  Future<String?> readCode() async {
    final pinCode = await _secureStorageService.read(key: pinKey);
    return pinCode;
  }

  void savePin() {
    _secureStorageService.write(
      key: pinKey,
      value: pin1,
    );
    _storageService.write(
      key: lastLoginTimeKey,
      value: DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  void deletePin() {
    _secureStorageService.delete(
      key: pinKey,
    );
  }

  Future<void> init() async {
    final pinCode = readCode();
    myCode = await pinCode ?? '';
    pin1 = myCode;
    notifyListeners();
  }
}
