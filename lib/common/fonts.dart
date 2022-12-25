// ignore: avoid_classes_with_only_static_members
import 'package:decksly/common/colors.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class FontStyles {

  static const String FONT_FAMILY = "Belwe";

  static TextStyle get semiBold12 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: AppColors.text,
      );

  static TextStyle semiBold15 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: AppColors.text,
  );

  static TextStyle semiBold20 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.text,
  );

  static TextStyle semiBold22 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22,
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
}
