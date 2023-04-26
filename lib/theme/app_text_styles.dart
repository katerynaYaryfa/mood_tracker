import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

abstract class TextStyles {
  static const TextStyle s22W700CBlack = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 27.5 / 22,
    color: AppColors.black,
  );

  static const TextStyle s16WNormalCBlack = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle s16W700CBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 20 / 16,
    color: AppColors.black,
  );

  static const TextStyle s16WBoldCGrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 20 / 16,
    color: AppColors.grey,
  );

  static const TextStyle s16W600CRed = TextStyle(
    color: AppColors.red,
    fontWeight: FontWeight.w600,
    height: 16 / 14,
    fontSize: 16,
  );

  static const TextStyle s14WNormalCGrey2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 16 / 14,
    color: AppColors.grey2,
  );

  static const TextStyle s14W600CBlack2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 17.5 / 14,
    color: AppColors.black2,
    fontFamily: 'Quicksand',
  );

  static const TextStyle s12WBoldCGrey2 = TextStyle(
    color: AppColors.grey2,
    fontWeight: FontWeight.w700,
    height: 12.5 / 10,
    fontSize: 10,
  );

  static const TextStyle s12WBoldCWhite = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}
