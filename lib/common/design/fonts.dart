// ignore: avoid_classes_with_only_static_members
import 'package:decksly/common/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
class FontStyles {
  static const String kFontFamily = "Belwe";

  // Regular Belwe

  static TextStyle regular15 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: AppColors.white,
  );

  static TextStyle regular15Black = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: Colors.black,
  );

  static TextStyle regular17 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.white,
  );

  static TextStyle regular17Grey = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.spanishGrey,
  );

  static TextStyle regular17NavajoWhite = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.navajoWhite,
  );

  static TextStyle regular17VanDykeBrown = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
    color: AppColors.vanDykeBrown,
  );

  // Bold Belwe

  static TextStyle bold11 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 11.sp,
    color: AppColors.white,
  );

  static TextStyle bold11WithShadow = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 11.sp,
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

  static TextStyle bold11Purple = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 11.sp,
    color: AppColors.purple,
  );

  static TextStyle bold13Gold = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 13.sp,
    color: AppColors.gold,
  );

  static TextStyle bold13Green = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 13.sp,
    color: Colors.green,
  );

  static TextStyle bold13VanDykeBrown = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 13.sp,
    color: AppColors.vanDykeBrown,
  );

  static TextStyle bold15 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: AppColors.white,
  );

  static TextStyle bold15VanDykeBrown = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 15.sp,
    color: AppColors.vanDykeBrown,
  );

  static TextStyle bold15DarkChestnutBrown = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 15.sp,
    color: AppColors.darkChestnutBrown,
  );

  static TextStyle bold15Gold = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: AppColors.gold,
  );

  static TextStyle bold17 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 17.sp,
    color: AppColors.white,
  );

  static TextStyle bold17WithShadow = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 17.sp,
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

  static TextStyle bold17DarkChestnutBrown = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.darkChestnutBrown,
  );

  static TextStyle bold17Grey = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.spanishGrey,
  );

  static TextStyle bold17Gold = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 17.sp,
    color: AppColors.gold,
  );

  static TextStyle bold22 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.white,
  );

  static TextStyle bold22WithShadow = TextStyle(
    fontFamily: kFontFamily,
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

  static TextStyle bold22GoldWithShadow = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.gold,
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
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 25.sp,
    color: AppColors.vanDykeBrown,
  );

  static TextStyle bold25WithShadow = TextStyle(
    fontFamily: kFontFamily,
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
    fontFamily: kFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
    color: AppColors.white,
  );

  // Light Belwe

  static TextStyle light15 = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 15.sp,
    color: AppColors.white,
  );
}
