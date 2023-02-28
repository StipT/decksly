import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSSelectedDropdownButtonOverlay extends StatelessWidget {
  const HSSelectedDropdownButtonOverlay({Key? key, this.isDropdownButton = false}) : super(key: key);

  final bool isDropdownButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_DROPDOWN,
                isDropdownButton ? "selected_dropdown_button_left" : "selected_dropdown_button_left_iconless"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              assetPath(SUBFOLDER_DROPDOWN, "selected_dropdown_button_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_DROPDOWN, "selected_dropdown_button_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
