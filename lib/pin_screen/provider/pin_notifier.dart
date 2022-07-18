import 'package:flutter/material.dart';

class PinNotifier with ChangeNotifier {
  String oldPin = '';
  Color color1 = Colors.grey.shade400;
  Color color2 = Colors.grey.shade400;
  Color color3 = Colors.grey.shade400;
  Color color4 = Colors.grey.shade400;

  bool isPressed = false;
  String pin1 = '';
  String pin2 = '';
  bool wrongPin = false;

  void pinCode(String num) async {
    if (pin1.length == 4) {
      pin2 = pin2 + num;
    } else {
      pin1 = pin1 + num;
    }
    print('pin1 _______ ${pin1}');
    print('pin2 _______ ${pin2}');

    if (pin2.length == 4 && pin2 != pin1) {
      pin2 = '';
      wrongPin = true;
    }

    notifyListeners();
  }

  void changeColor() {
    if (isPressed = true) {
      String str = oldPin;
      String string = str + '0';
      oldPin = '${oldPin}0';
      if (string.length == 1) {
        color1 = Colors.red;
      }
      if (string.length == 2) {
        color2 = Colors.red;
      }
      if (string.length == 3) {
        color3 = Colors.red;
      }
      if (string.length == 4) {
        color4 = Colors.red;
      }
    }
    notifyListeners();
  }
}
