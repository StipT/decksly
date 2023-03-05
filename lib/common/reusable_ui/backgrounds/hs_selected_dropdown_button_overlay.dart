import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSSelectedDropdownButtonOverlay extends StatelessWidget {
  const HSSelectedDropdownButtonOverlay({super.key, this.isDropdownButton = false});

  final bool isDropdownButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(
              kSubfolderDropdown,
              isDropdownButton ? "selected_dropdown_button_left" : "selected_dropdown_button_left_iconless",
            ),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Image.asset(
              assetPath(kSubfolderDropdown, "selected_dropdown_button_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderDropdown, "selected_dropdown_button_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
