import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/app_colors.dart';

// TODO it will be better to create class TextStyles and put all these styles into it.
// TODO so you can use it like TextStyles.s22W700CBlack instead of just s22W700CBlack.
const TextStyle s22W700CBlack = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  height: 27.5 / 22,
  color: AppColors.black,
);

const TextStyle s16WNormalCBlack = TextStyle(
  fontSize: 16,
  color: AppColors.black,
);

const TextStyle s16W700CBlack = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  height: 20 / 16,
  color: AppColors.black,
);

const TextStyle s16WBoldCGrey = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  height: 20 / 16,
  color: AppColors.grey,
);

const TextStyle s16W600CRed = TextStyle(
  color: AppColors.red,
  fontWeight: FontWeight.w600,
  height: 16 / 14,
  fontSize: 16,
);

const TextStyle s14WNormalCGrey2 = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  height: 16 / 14,
  color: AppColors.grey2,
);

const TextStyle s14W600CBlack2 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  height: 17.5 / 14,
  color: AppColors.black2,
  fontFamily: 'Quicksand',
);

const TextStyle s12WBoldCGrey2 = TextStyle(
  color: AppColors.grey2,
  fontWeight: FontWeight.w700,
  height: 12.5 / 10,
  fontSize: 10,
);

const TextStyle s12WBoldCWhite = TextStyle(
  color: AppColors.white,
  fontWeight: FontWeight.bold,
  fontSize: 12,
);
