import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_text_field_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_rectangular_golden_border.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_horizontal_border.dart';
import 'package:decksly/common/util/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class HSTextField extends StatefulWidget {
  const HSTextField({
    Key? key,
    required this.theme,
    required this.suffix,
    required this.onChange,
    required this.onSubmitted,
    this.hint,
  }) : super(key: key);

  final void Function(String) onChange;
  final void Function(String) onSubmitted;
  final TextFieldTheme theme;
  final TextFieldSuffix suffix;
  final String? hint;

  @override
  State<HSTextField> createState() => _HSTextFieldState();
}

class _HSTextFieldState extends State<HSTextField> {
  final _textEditingController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  final FocusNode _focus = FocusNode();
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _getMargin(widget.theme),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _getBorder(widget.theme),
          const HSRectangularGoldenBorder(),
          if (!isEmpty) const HSActiveTextFieldOverlay(),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 15.w,
              right: 7.5.w,
            ),
            child: TextField(
              textInputAction: _getInputAction(widget.suffix),
              onSubmitted: (value) => widget.onSubmitted(value),
              focusNode: _focus,
              controller: _textEditingController,
              onChanged: (searchString) {
                setState(() {
                  isEmpty = _textEditingController.text.trim().isEmpty;
                });

                _debouncer.run(() {
                  widget.onChange(searchString);
                });
              },
              textAlignVertical: TextAlignVertical.center,
              style: FontStyles.bold15,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: _suffixIcon(widget.suffix),
                hintText: widget.hint,
                hintStyle: FontStyles.bold15DarkChestnutBrown,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _suffixIcon(TextFieldSuffix suffix) {
    switch (suffix) {
      case TextFieldSuffix.none:
        return const SizedBox();
      case TextFieldSuffix.search:
        return IconButton(
          iconSize: 22.5.w,
          onPressed: () {
            if (!isEmpty) {
              setState(() {
                _textEditingController.clear();
                isEmpty = _textEditingController.text.isEmpty;
                widget.onChange(_textEditingController.text);
              });
            }
          },
          icon: Icon(
            isEmpty ? Icons.search : Icons.close,
          ),
          color: AppColors.gold,
        );
      case TextFieldSuffix.paste:
        return IconButton(
          iconSize: 22.5.w,
          onPressed: () {
            Clipboard.getData(Clipboard.kTextPlain).then((value) {
              setState(() {
                _textEditingController.text = value?.text ?? "";
                isEmpty = _textEditingController.text.trim().isEmpty;
                widget.onChange(_textEditingController.text);
              });
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
