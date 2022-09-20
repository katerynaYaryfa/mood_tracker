import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

enum Mood {
  none,
  crying,
  veryBad,
  bad,
  normal,
  good,
  veryGood,
}

class NoteNotifier with ChangeNotifier {
  List<File> images = [];
  Mood mood = Mood.none;

  void deleteImage(image) {
    images.remove(image);
    notifyListeners();
  }

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);

      images.add(imageTemp);
    } on PlatformException catch (e) {}
    notifyListeners();
  }

  void changeMood(Mood mood) {
    this.mood = mood;
    notifyListeners();
  }
}
