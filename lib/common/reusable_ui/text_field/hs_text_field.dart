import "package:decksly/common/design/colors.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_active_text_field_overlay.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_rectangular_golden_border.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_velvet_border.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_wood_horizontal_border.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

enum TextFieldTheme {
  none,
  velvet,
  purpleVelvet,
  wood,
}

enum TextFieldSuffix {
  none,
  search,
  paste,
}

class HSTextField extends HookWidget {
  const HSTextField({
    super.key,
    required this.theme,
    required this.suffix,
    required this.onChange,
    required this.onSubmitted,
    this.hint,
  });

  final void Function(String) onChange;
  final void Function(String) onSubmitted;
  final TextFieldTheme theme;
  final TextFieldSuffix suffix;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final isEmpty = useState(true);
    final focus = useFocusNode();
    final textEditingController = useTextEditingController();
    return Container(
      margin: _getMargin(theme),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _getBorder(theme),
          const HSRectangularGoldenBorder(),
          if (!isEmpty.value) const HSActiveTextFieldOverlay(),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 15.w,
              right: 7.5.w,
            ),
            child: TextField(
              textInputAction: _getInputAction(suffix),
              onSubmitted: (value) => onSubmitted(value),
              focusNode: focus,
              controller: textEditingController,
              onChanged: (searchString) {
                isEmpty.value = textEditingController.text.trim().isEmpty;
                onChange(searchString);
              },
              textAlignVertical: TextAlignVertical.center,
              style: FontStyles.bold15(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2.5.h),
                border: InputBorder.none,
                suffixIcon: _suffixIcon(suffix, isEmpty, textEditingController),
                hintText: hint,
                hintStyle: FontStyles.bold15DarkChestnutBrown(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _suffixIcon(TextFieldSuffix suffix, ValueNotifier<bool> isEmpty, TextEditingController textEditingController) {
    switch (suffix) {
      case TextFieldSuffix.none:
        return const SizedBox();
      case TextFieldSuffix.search:
        return IconButton(
          key: const Key("searchSuffixIcon"),
          iconSize: 22.5.w,
          onPressed: () {
            if (!isEmpty.value) {
              textEditingController.clear();
              isEmpty.value = textEditingController.text.isEmpty;
              onChange(textEditingController.text);
            }
          },
          icon: Icon(
            isEmpty.value ? Icons.search : Icons.close,
          ),
          color: AppColors.gold,
        );
      case TextFieldSuffix.paste:
        return IconButton(
          key: const Key("pasteSuffixIcon"),
          iconSize: 22.5.w,
          onPressed: () {
            Clipboard.getData(Clipboard.kTextPlain).then((value) {
              textEditingController.text = value?.text ?? "";
              isEmpty.value = textEditingController.text.trim().isEmpty;
              onChange(textEditingController.text);
            });
          },
          icon: const Icon(
            Icons.paste,
            color: AppColors.gold,
          ),
        );
    }
  }

  Widget _getBorder(TextFieldTheme theme) {
    switch (theme) {
      case TextFieldTheme.none:
        return const SizedBox();
      case TextFieldTheme.velvet:
        return const HSVelvetBorder();
      case TextFieldTheme.purpleVelvet:
        return const HSVelvetBorder();
      case TextFieldTheme.wood:
        return const HSWoodHorizontalBorder();
    }
  }

  TextInputAction _getInputAction(TextFieldSuffix suffix) {
    switch (suffix) {
      case TextFieldSuffix.none:
        return TextInputAction.none;
      case TextFieldSuffix.paste:
        return TextInputAction.go;
      case TextFieldSuffix.search:
        return TextInputAction.search;
    }
  }

  EdgeInsets _getMargin(TextFieldTheme theme) {
    switch (theme) {
      case TextFieldTheme.none:
        return EdgeInsets.zero;
      case TextFieldTheme.velvet:
        return EdgeInsets.zero;
      case TextFieldTheme.purpleVelvet:
        return EdgeInsets.only(
          left: 16.w,
          right: 4.w,
          top: 0.875.h,
        );
      case TextFieldTheme.wood:
        return EdgeInsets.symmetric(vertical: 0.875.h, horizontal: 24.w);
    }
  }
}
