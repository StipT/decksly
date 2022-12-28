// ignore: avoid_classes_with_only_static_members
import 'package:decksly/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class FontStyles {
  static const String FONT_FAMILY = "Belwe";

  static TextStyle get bold12 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: AppColors.text,
      );

  static TextStyle bold15 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: AppColors.text,
  );

  static TextStyle bold20 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.text,
  );

  static TextStyle bold22 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.text,
  );

  static TextStyle bold28 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: AppColors.text,
  );

  static TextStyle regular11 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.text,
  );

  static TextStyle regular12 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.text,
  );

  static TextStyle regular15 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColors.text,
  );

  static TextStyle regular20 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColors.text,
  );

  static TextStyle regular12Grey = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Colors.grey,
  );

  static TextStyle regular15Grey = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Colors.grey,
  );

  static TextStyle light12 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.text,
  );

  static TextStyle light13 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 13,
    color: AppColors.text,
  );

  static TextStyle light15 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: AppColors.text,
  );

  static TextStyle light20 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: AppColors.text,
  );
}
