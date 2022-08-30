import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../provider/settings_notifier.dart';

class PhotoOfTheDayWidget extends StatelessWidget {
  const PhotoOfTheDayWidget({
    Key? key,
    required this.images,
    required this.pickImage,
    required this.imageSize,
  }) : super(key: key);

  final List<File> images;
  final Future Function() pickImage;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
      // height: 364,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Photo of the day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                          : const Color(0xFFFF7562)),
                ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          if (images.length == 1)
            AddNewImage(
              left: 19,
              top: 258,
              image: images[0],
              height: 296,
              width: 296,
              cacheHeight: 296,
              cacheWidth: 296,
              // vertical: 258,
              // horizontal: 16,
            ),
          if (images.length == 2)
            Row(
              children: [
                AddNewImage(
                  left: 11,
                  top: 110,
                  height: 140,
                  width: 140,
                  image: images[0],
                  cacheHeight: 140,
                  cacheWidth: 140,
                  // vertical: 110,
                  // horizontal: 11,
                ),
                SizedBox(
                  width: 16,
                ),
                AddNewImage(
                  height: 140,
                  width: 140,
                  image: images[1],
                  cacheHeight: 140,
                  cacheWidth: 140,
                  left: 11,
                  top: 110,
                )
              ],
            ),
          if (images.length == 3)
            Row(
              children: [
                AddNewImage(
                  height: 88,
                  width: 88,
                  image: images[0],
                  cacheHeight: 88,
                  cacheWidth: 88,
                  left: 11,
                  top: 58,
                ),
                SizedBox(
                  width: 15,
                ),
                AddNewImage(
                  height: 88,
                  width: 88,
                  image: images[1],
                  cacheHeight: 88,
                  cacheWidth: 88,
                  left: 11,
                  top: 58,
                ),
                SizedBox(
                  width: 15,
                ),
                AddNewImage(
                  height: 88,
                  width: 88,
                  image: images[2],
                  cacheHeight: 88,
                  cacheWidth: 88,
                  left: 11,
                  top: 58,
                )
              ],
            ),
          if (images.isEmpty)
            InkWell(
              onTap: () {
                pickImage();
              },
              child: Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: const Color(0xffF6FAFB),
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
    );
  }
}

class AddNewImage extends StatelessWidget {
  const AddNewImage({
    required this.height,
    required this.image,
    required this.width,
    required this.cacheHeight,
    required this.cacheWidth,
    required this.left,
    required this.top,
    // required this.bottom,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final File image;
  final int cacheHeight;
  final int cacheWidth;
  final double left;
  final double top;
  // final double bottom;

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.file(
              image,
              cacheHeight: cacheHeight,
              cacheWidth: cacheWidth,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: left,
            top: top,
            // bottom: bottom,
          ),
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
