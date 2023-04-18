import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mood_tracker/services/storage_service.dart';

class PinProvider with ChangeNotifier {
  PinProvider() {
    _init();
  }

  bool isPressed = false;
  String pin1 = '';
  String pin2 = '';
  bool wrongPin = false;
  String myCode = '';

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

  var color = Colors.grey.shade400;
  var wrongPinColor = Colors.transparent;

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

  final storage = FlutterSecureStorage();

  Future<String?> readCode() async {
    String? pinCode = await storage.read(key: 'pin');
    return pinCode;
  }

  void _init() async {
    Future<String?> pinCode = readCode();

    myCode = await pinCode ?? '';
    pin1 = myCode;
    notifyListeners();
  }
}
