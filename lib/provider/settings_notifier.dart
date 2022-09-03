import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SettingsNotifier with ChangeNotifier {
  // File? image;
  List<File> images = [];

  void deleteImage(image) {
    images.remove(image);
    notifyListeners();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);

      images.add(imageTemp);
      // this.image = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick Image $e');
    }
    notifyListeners();
  }
}
