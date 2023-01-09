import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_text_field_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_rectangular_golden_border.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:decksly/reusable_ui/text_field/debouncer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSTextField extends StatefulWidget {
  const HSTextField({Key? key, required this.onChange}) : super(key: key);

  final void Function(String) onChange;

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
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const HSVelvetBorder(),
          const HSRectangularGoldenBorder(),
          if (!isEmpty) const HSActiveTextFieldOverlay(),
          Container(
            margin: EdgeInsets.only(
              left: 8.w,
              right: 2.w,
            ),
            child: TextField(
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
              style: FontStyles.bold17,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
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
                ),
                hintText: LocaleKeys.search.tr(),
                hintStyle: FontStyles.bold17DarkChestnutBrown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
