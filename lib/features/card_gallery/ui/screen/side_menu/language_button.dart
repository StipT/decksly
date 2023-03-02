import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum LanguageButtonType {
  english,
  german,
  japanese,
}

extension LanguageButtonTypeValues on LanguageButtonType {
  String get value {
    switch (this) {
      case LanguageButtonType.english:
        return "en_US";
      case LanguageButtonType.german:
        return "de_DE";
      case LanguageButtonType.japanese:
        return "ja_JP";
    }
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    this.type,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final LanguageButtonType? type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 0.875.h),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: _getFlag(),
      ),
    );
  }

  Widget _getFlag() {
    String? imageAssetName;
    switch (type) {
      case LanguageButtonType.english:
        imageAssetName = "english_flag";
        break;
      case LanguageButtonType.german:
        imageAssetName = "german_flag";
        break;
      case LanguageButtonType.japanese:
        imageAssetName = "japanese_flag";
        break;

      default:
        imageAssetName = "english_flag";
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.transparent : AppColors.velvet,
        BlendMode.saturation,
      ),
      child: Image.asset(
        assetPath(kSubfolderMisc, imageAssetName),
        fit: BoxFit.fitWidth,
        width: 60.w,
      ),
    );
  }
}
