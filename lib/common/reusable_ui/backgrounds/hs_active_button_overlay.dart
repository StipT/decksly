import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/widgets.dart";

class HSActiveButtonOverlay extends StatelessWidget {
  const HSActiveButtonOverlay({super.key, this.isDropdownButton = false});

  final bool isDropdownButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            isDropdownButton
                ? assetPath(kSubfolderDropdown, "focused_dropdown_button_left")
                : assetPath(kSubfolderButton, "focused_button_left"),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Image.asset(
              assetPath(kSubfolderButton, "focused_button_center"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            assetPath(kSubfolderButton, "focused_button_right"),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
