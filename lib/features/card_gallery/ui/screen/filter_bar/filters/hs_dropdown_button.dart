import 'package:decksly/common/fonts.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_rectangular_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSDropdownButton extends StatelessWidget {
  HSDropdownButton({Key? key, required this.title, required this.icon}) : super(key: key);

  final String title;
  final Widget icon;
  List<String> dropdownValues = [];

  @override
  Widget build(BuildContext context) {
    dropdownValues = ["Warlock", "Paladin", "Warrior"];
    return Container(
      height: 100,
      width: 70,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 0.001.sh),
      child: InkWell(
        onTap: () {
          print("CLICK");
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const HSRectangularOutline(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: double.infinity,
                  child: Image.asset(
                    "assets/dropdown/dropdown_button_border_left.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/button/button_border_center.png",
                      fit: BoxFit.fill,
                    ),
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
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 0.5.w,
                right: 5.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: icon,
                    width: 20.w,
                  ),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        value: "Paladin",
                        elevation: 5,
                        style: const TextStyle(color: Colors.white),
                        items: dropdownValues.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              maxLines: 2,
                              style: FontStyles.bold17Button,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                        dropdownColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
