import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

enum Mood {
  none,
  crying,
  veryBad,
  bad,
  normal,
  good,
  veryGood,
}

class NoteProvider with ChangeNotifier {
  List<File> images = [];
  Mood mood = Mood.none;

  void year() {
    List yearsList = [];

    DateFormat dateFormat = DateFormat("yyyy");
    String stringYear = dateFormat.format(DateTime.now());
    int intYear = int.parse(stringYear);
    for (intYear; intYear > 1999; intYear--) {
      yearsList.add(intYear);
    }
  }

  void deleteImage(image) {
    images.remove(image);
    notifyListeners();
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);

    images.add(imageTemp);
    notifyListeners();
  }

  void changeMood(Mood mood) {
    this.mood = mood;
    notifyListeners();
  }
}
