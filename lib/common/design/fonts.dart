// ignore: avoid_classes_with_only_static_members
import 'package:decksly/common/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
class FontStyles {
  static const String FONT_FAMILY = "Belwe";

  // Regular Belwe

  static TextStyle regular17 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.white,
  );

  static TextStyle regular17Grey = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.spanishGrey,
  );

  static TextStyle regular17VanDykeBrown = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.vanDykeBrown,
  );

  static TextStyle regular20 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: AppColors.white,
  );

  static TextStyle regular20Grey = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: Colors.grey,
  );

  // Bold Belwe

  static TextStyle bold15 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: AppColors.white,
  );

  static TextStyle bold15VanDykeBrown = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w700,
    fontSize: 15.sp,
    color: AppColors.vanDykeBrown,
  );

  static TextStyle bold17 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 17.sp,
    color: AppColors.white,
  );

  static TextStyle bold17DarkChestnutBrown = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.darkChestnutBrown,
  );

  static TextStyle bold17Grey = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.spanishGrey,
  );

  static TextStyle bold17Gold = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 17.sp,
    color: AppColors.gold,
  );

  static TextStyle bold22 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.white,
  );

  static TextStyle bold22WithShadow = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.white,
    shadows: const <Shadow>[
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 5.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 8.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  static TextStyle bold25VanDykeBrown = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 25.sp,
    color: AppColors.vanDykeBrown,
  );

  static TextStyle bold25WithShadow = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 25.sp,
    color: AppColors.white,
    shadows: const <Shadow>[
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 5.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 8.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  static TextStyle bold28 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
    color: AppColors.white,
  );

  // Light Belwe

  static TextStyle light15 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w300,
    fontSize: 15.sp,
    color: AppColors.white,
  );

  static TextStyle light17 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w300,
    fontSize: 17.sp,
    color: AppColors.white,
  );

  static TextStyle light22 = TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w300,
    fontSize: 22.sp,
    color: AppColors.white,
  );
}
