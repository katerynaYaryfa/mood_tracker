import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/provider/settings_notifier.dart';
import 'package:mood_tracker/select_categories_screen.dart';
import 'package:provider/provider.dart';

import 'day_in_one_sentence_widget.dart';
import 'how_was_your_day_widget.dart';

class AddNewNoteScreen extends StatefulWidget {
  const AddNewNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState();
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final images = context.watch<SettingsNotifier>().images;
    final pickImage = context.watch<SettingsNotifier>().pickImage;
    print('_______AddNewNoteScreen____images $images');
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFB),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFFFF7562),
        onPressed: () {},
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF7562).withOpacity(0.3),
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: const Icon(
            Icons.done,
            size: 24,
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SelectCategoriesScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 26),
              child: SvgPicture.asset(
                'images/settings.svg',
                color: const Color(0xFFD1D4DE),
              ),
            ),
          )
        ],
        title: const Text(
          'Monday, July 11',
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const HowWasYourDayWidget(),
              const SizedBox(
                height: 16,
              ),
              const DayInOneSentenceWidget(),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 364,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),

                // width: 328,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFE),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF738C93).withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Photo of the day',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (images.isEmpty) Container(),
                        if (images.length == 3)
                          SvgPicture.asset('images/addNewImage.svg',
                              color: const Color(0xFFFFBAB0)),
                        if (images.length >= 1 && images.length < 3)
                          InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: SvgPicture.asset('images/addNewImage.svg',
                                color: images.length == 3
                                    ? const Color(0xFFFFBAB0)
                                    : const Color(0xFFFF7562)
                                // color: Color(0xFFFF7562),
                                ),
                          ),
                      ],
                    ),
                    if (images.length == 1)
                      NewWidget(
                        image: images[0],
                        height: 296,
                        width: 296,
                        cacheHeight: 296,
                        cacheWidth: 296,
                        vertical: 258,
                        horizontal: 19,
                      ),
                    if (images.length == 2)
                      Row(
                        children: [
                          NewWidget(
                            height: 140,
                            width: 140,
                            image: images[0],
                            cacheHeight: 140,
                            cacheWidth: 140,
                            vertical: 110,
                            horizontal: 11,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          NewWidget(
                            height: 140,
                            width: 140,
                            image: images[1],
                            cacheHeight: 140,
                            cacheWidth: 140,
                            vertical: 110,
                            horizontal: 11,
                          )
                        ],
                      ),
                    if (images.length == 3)
                      Row(
                        children: [
                          NewWidget(
                            height: 88,
                            width: 88,
                            image: images[0],
                            cacheHeight: 88,
                            cacheWidth: 88,
                            vertical: 58,
                            horizontal: 11,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          NewWidget(
                            height: 88,
                            width: 88,
                            image: images[1],
                            cacheHeight: 88,
                            cacheWidth: 88,
                            vertical: 58,
                            horizontal: 11,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          NewWidget(
                            height: 88,
                            width: 88,
                            image: images[2],
                            cacheHeight: 88,
                            cacheWidth: 88,
                            vertical: 58,
                            horizontal: 11,
                          )
                        ],
                      )
                    else
                      InkWell(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          // margin: EdgeInsets.symmetric(horizontal: 16),
                          // padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 296,
                          width: 296,

                          decoration: BoxDecoration(
                            color: const Color(0xffF6FAFB),
                            // color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/addPhoto.svg',
                                color: const Color(0xFFD1D4DE),
                              ),
                              const SizedBox(
                                height: 11.0,
                              ),
                              const Text(
                                'Add up to 3 photo',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD1D4DE),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    required this.height,
    required this.image,
    required this.width,
    required this.cacheHeight,
    required this.cacheWidth,
    required this.vertical,
    required this.horizontal,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final File image;
  final int cacheHeight;
  final int cacheWidth;
  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0xffF6FAFB),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Image.file(
            image,
            cacheHeight: cacheHeight,
            cacheWidth: cacheWidth,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: InkWell(
            onTap: () {
              context.read<SettingsNotifier>().deleteImage(image);
            },
            child: SvgPicture.asset(
              'images/trash.svg',
              // color: Color(0xFFFF7562),
            ),
          ),
        ),
      ],
    );
  }
}
