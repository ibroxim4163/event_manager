import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  ///home page
  static TextStyle get weekDay => const TextStyle(
        fontSize: 20,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );

  static TextStyle get date => const TextStyle(
        fontSize: 20,
        color: AppColors.blackColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      );

  static TextStyle get schedule => const TextStyle(
        fontSize: 15,
        color: AppColors.blackColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      );

  static TextStyle get addEvent => const TextStyle(
        fontSize: 11,
        fontFamily: "Poppins",
      );

  static TextStyle get eventText => TextStyle(
        color: Colors.blue.shade700,
        fontWeight: FontWeight.w600,
      );
  static TextStyle eventTitle(int index) {
    return TextStyle(
      color: AppColors.primaries[index],
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  // details page
  static const TextStyle eventName = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Poppins",
    fontSize: 25,
  );

  static const eventDescription = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Poppins",
    fontSize: 10,
  );

  static const whiteFont600 = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static const title = TextStyle(
    fontSize: 18,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Poppins",
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
  );
}
