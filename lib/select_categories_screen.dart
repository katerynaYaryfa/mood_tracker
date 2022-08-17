import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SelectCategoriesScreen extends StatefulWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFFD1D4DE),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Select categories',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color(
            0xFFF6FAFB,
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                maxLines: 3,
                // keyboardType: TextInputType.multiline,
                // maxLines: null,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2000),
                ],
                // maxLines: 5,
                // minLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  filled: true,
                  fillColor: Color(0xFFF6FAFB),
                  labelText: 'Enter your thoughts',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border:
                      // InputBorder.none
                      OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  selectImages();
                },
                child: Text('Select Images'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: imageFileList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
