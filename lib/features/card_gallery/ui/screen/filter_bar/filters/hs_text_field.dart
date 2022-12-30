import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSTextField extends StatefulWidget {
  const HSTextField({Key? key}) : super(key: key);

  @override
  State<HSTextField> createState() => _HSTextFieldState();
}

class _HSTextFieldState extends State<HSTextField> {
  final _textEditingController = TextEditingController();
  bool isEmpty = true;

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

          // Functional foreground
          Container(
              margin: EdgeInsets.only(
                left: 8.w,
                right: 2.w,
              ),
              child: TextField(
                controller: _textEditingController,
                onChanged: (text) {
                  setState(() {
                    isEmpty = _textEditingController.text.isEmpty;
                  });
                },
                style: FontStyles.bold15,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (!isEmpty) {
                        _textEditingController.clear();
                        setState(() {
                          isEmpty = _textEditingController.text.isEmpty;
                        });
                      }
                    },
                    icon: Icon(isEmpty ? Icons.search : Icons.close),
                    color: AppColors.accentYellow,
                  ),
                  hintText: "Search",
                  hintStyle: FontStyles.bold17Hint,
                ),
              )),
        ],
      ),
    );
  }
}
