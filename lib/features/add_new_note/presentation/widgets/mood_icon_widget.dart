import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  const MoodIcon({
    Key? key,
    required this.opacity,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final double opacity;
  final void Function() onTap;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Image(
          width: 32,
          height: 34,
          image: image,
        ),
      ),
    );
  }
}
