import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

class AverageMoodWidget extends StatelessWidget {
  const AverageMoodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 10,
            blurRadius: 15,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 107,
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                height: 40,
                width: 40,
                image: AssetImage(
                  'images/face1.png',
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Column(
                children: [
                  const Text(
                    'Average mood',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'vs. previous period',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
              Expanded(child: Container()),
              const Text(
                '+0%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 20,
                  width: 148,
                  color: Colors.white,
                  child: const RotatedBox(
                    quarterTurns: 2,
                    child: ProgressBar(
                      gradientDefault: [
                        Alignment.topCenter,
                        Alignment.bottomCenter,
                      ],
                      colorsDefault: [
                        AppColors.blue2,
                        AppColors.blue2,
                      ],
                      gradientCompleted: [
                        Alignment.centerLeft,
                        Alignment.centerRight,
                      ],
                      colorsCompleted: [
                        AppColors.blue,
                        AppColors.blue,
                      ],
                      height: 24.0,
                      radius: 70.0,
                      ratio: 0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 20,
                  width: 148,
                  color: Colors.white,
                  child: const ProgressBar(
                    gradientDefault: [
                      Alignment.topCenter,
                      Alignment.bottomCenter,
                    ],
                    colorsDefault: [AppColors.green3, AppColors.green3],
                    gradientCompleted: [
                      Alignment.centerLeft,
                      Alignment.centerRight,
                    ],
                    colorsCompleted: [AppColors.green, AppColors.green],
                    height: 24.0,
                    radius: 70.0,
                    ratio: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.gradientDefault,
    required this.gradientCompleted,
    required this.colorsDefault,
    required this.colorsCompleted,
    this.height = 20.0,
    this.radius = 10.0,
    required this.ratio,
  }) : super(key: key);

  final List<AlignmentGeometry> gradientDefault;
  final List<AlignmentGeometry> gradientCompleted;
  final List<Color> colorsDefault;
  final List<Color> colorsCompleted;
  final double height;
  final double radius;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (ratio < 1.0)
            ProgressBarElement(
              borderRadius: const BorderRadius.only(
                // topLeft: Radius.circular(20),
                // bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(9),
                topRight: Radius.circular(9),
              ),
              begin: gradientDefault[0],
              end: gradientDefault[1],
              colors: colorsDefault,
            ),
          if (ratio > 0.0)
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: ratio,
              child: ProgressBarElement(
                borderRadius: const BorderRadius.only(
                  // topLeft: Radius.circular(20),
                  // bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
                begin: gradientCompleted[0],
                end: gradientCompleted[1],
                colors: colorsCompleted,
              ),
            ),
        ],
      ),
    );
  }
}

class ProgressBarElement extends StatelessWidget {
  const ProgressBarElement({
    Key? key,
    required this.borderRadius,
    required this.begin,
    required this.end,
    required this.colors,
  }) : super(key: key);

  final BorderRadius borderRadius;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          gradient: LinearGradient(begin: begin, end: end, colors: colors),
        ),
      );
}
