// ignore: avoid_classes_with_only_static_members
import 'package:decksly/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
class FontStyles {
  static const String FONT_FAMILY = "Belwe";

  static TextStyle get bold12 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        color: AppColors.text,
      );

  static TextStyle bold15 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: AppColors.text,
  );

  static TextStyle bold20 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    color: AppColors.text,
  );

  static TextStyle bold22 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.text,
  );

  static TextStyle bold28 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
    color: AppColors.text,
  );

  static TextStyle regular11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11.sp,
    color: AppColors.text,
  );

  static TextStyle regular12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.text,
  );

  static TextStyle regular15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: AppColors.text,
  );

  static TextStyle regular20 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: AppColors.text,
  );

  static TextStyle regular12Grey = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: Colors.grey,
  );

  static TextStyle regular15Grey = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: Colors.grey,
  );

  static TextStyle regular20Grey = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: Colors.grey,
  );

  static TextStyle light12 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
    color: AppColors.text,
  );

  static TextStyle light13 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 13.sp,
    color: AppColors.text,
  );

  static TextStyle light15 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15.sp,
    color: AppColors.text,
  );

  static TextStyle light20 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15.sp,
    color: AppColors.text,
  );

  static TextStyle bold17Hint = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.hintTextColor,
  );

  static TextStyle bold17Button = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.buttonTextColor,
  );
}
