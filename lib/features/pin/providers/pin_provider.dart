import 'package:flutter/material.dart';
import 'package:mood_tracker/services/storage_service.dart';

// TODO extends ChangeNotifier
class PinProvider with ChangeNotifier {
  // TODO this variable is not used
  bool isPressed = false;
  String pin1 = '';
  String pin2 = '';
  bool wrongPin = false;

  // TODO this variable is not used
  var color = Colors.grey.shade400;

  void clearState() {
    pin1 = '';
    pin2 = '';
    wrongPin = false;
    isPressed = false;
  }

  // TODO this method is not used
  Future<String?> readSavedPinCode() async {
    var storage = StorageService();
    final savedPin = await storage.read(
      key: 'pin',
    );

    return savedPin;
  }

  // TODO think about better name for method
  void pinCode(String num) async {
    if (pin1.length == 4) {
      pin2 = pin2 + num;
      wrongPin = false;
    } else {
      pin1 = pin1 + num;
    }

    if (pin2.length == 4 && pin2 != pin1) {
      pin2 = '';
      wrongPin = true;
    }

    notifyListeners();
  }

  // TODO bad name for method. refactor to deleteSymbol or something else
  void deleteLastIndex() {
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
    // TODO 4 - is a magic number. refactor please
    // TODO also this is hard to read. Refactor it to
    // final shouldSavePin/shouldSave/etc = pin2.length == 4 && pin1 == pin2 && !pinCodeEnabled;
    if (pin2.length == 4 && pin1 == pin2 && !pinCodeEnabled) {
      var storage = StorageService();

      await storage.write(
        key: 'pin',
        value: pin1,
      );

      pinCodeEnabled = true;
      notifyListeners();
    }
  }

  // TODO put in in the top of your class with other variables
  bool pinCodeEnabled = false;

  void readStorageService() async {
    final storage = StorageService();
    final pin = await storage.read(
      key: 'pin',
    );
    if (pin != null) {
      pinCodeEnabled = true;
    }
    notifyListeners();
  }

  // TODO bad name for method. refactor to disablePinCode or something else
  void pinCodeFalse() {
    pinCodeEnabled = false;
    notifyListeners();
  }

  // TODO this method is not used
  void pinCodeTrue() {
    pinCodeEnabled = true;
    notifyListeners();
  }
}
