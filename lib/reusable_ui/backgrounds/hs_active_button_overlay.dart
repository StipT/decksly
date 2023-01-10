import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/widgets.dart';

class HSActiveButtonOverlay extends StatelessWidget {
  const HSActiveButtonOverlay({Key? key, this.isDropdownButton = false}) : super(key: key);
  final bool isDropdownButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            isDropdownButton ? assetPath(SUBFOLDER_DROPDOWN,  "focused_dropdown_button_left" ) : assetPath(SUBFOLDER_BUTTON, "focused_button_left"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              assetPath(SUBFOLDER_BUTTON, "focused_button_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(SUBFOLDER_BUTTON, "focused_button_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
