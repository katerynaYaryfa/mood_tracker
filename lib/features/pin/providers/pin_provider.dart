import 'package:flutter/material.dart';
import 'package:mood_tracker/services/storage_service.dart';

class PinProvider extends ChangeNotifier {
  // TODO this variable is not used
  bool isPressed = false;
  String pin1 = '';
  String pin2 = '';
  bool wrongPin = false;
  bool pinCodeEnabled = false;
  final int pinLength = 4;

  void clearState() {
    pin1 = '';
    pin2 = '';
    wrongPin = false;
    isPressed = false;
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

  // TODO context is not used
  void writePin(BuildContext context) async {
    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! TODO also this is hard to read. Refactor it to
    // final shouldSavePin/shouldSave/etc = pin2.length == 4 && pin1 == pin2 && !pinCodeEnabled;
    if (pin2.length == pinLength && pin1 == pin2 && !pinCodeEnabled) {
      var storage = StorageService();

      await storage.write(
        key: 'pin',
        value: pin1,
      );

      pinCodeEnabled = true;
      notifyListeners();
    }
  }

  void readPinCode() async {
    final storage = StorageService();
    final pin = await storage.read(
      key: 'pin',
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
