import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_text_field_overlay.dart';
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
      margin: EdgeInsets.symmetric(vertical: 0.001.sh),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Stylized Background
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      "assets/shared/border_left_outline.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      "assets/search/search_border_left.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/shared/border_center_outline.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/search/search_border_center.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      "assets/shared/border_right_outline.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      "assets/search/search_border_right.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),

          if (!isEmpty) const HSActiveTextFieldOverlay(),

          // Functional foreground
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
                  color: AppColors.accentYellow,
                ),
                hintText: LocaleKeys.search.tr(),
                hintStyle: FontStyles.bold17Hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
