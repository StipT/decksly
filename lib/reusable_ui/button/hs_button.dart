import 'package:decksly/common/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSButton extends StatelessWidget {
  const HSButton({Key? key, this.label, this.icon, required this.onTap}) : super(key: key);
  final String? label;
  final Widget? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 20.h,
        maxHeight: 50.h,
        minWidth: 15.w,
        maxWidth: 30.w,
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 0.001.sh),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Stack(
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
                            "assets/button/button_border_left.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/shared/border_center_outline.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/button/button_border_center.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Stack(
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
                            "assets/button/button_border_right.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                  top: 10.h,
                  bottom: 10.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: icon ?? const SizedBox(),
                      width: 15.w,
                    ),
                    Text(
                      label ?? "",
                      style: FontStyles.bold15Button,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
